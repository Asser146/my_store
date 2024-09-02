import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/core/helpers/item_list_params.dart';
import 'package:my_store/features/main_screen/data/item.dart';
import 'package:my_store/core/widgets/item_card_list/items_list_operations.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> with ItemsListOperations {
  List<Item> filteredItems = [];
  late ItemsListParams params;

  SearchCubit() : super(SearchInitial());

  Future<void> searchInit() async {
    emit(SearchLoading());
    init();
    emit(SearchLoaded(items: items, fav: favourites, cart: cartItems));
  }

  void search(List<Item> items, String query) {
    if (query.isEmpty) {
      filteredItems = [];
      emit(SearchInitial());
    } else {
      filteredItems = items.where((item) {
        return item.title?.toLowerCase().contains(query.toLowerCase()) ?? false;
      }).toList();
      emit(
          SearchLoaded(items: filteredItems, fav: favourites, cart: cartItems));
    }
  }

  ItemsListParams getParams() {
    params = ItemsListParams(
        list: filteredItems.isEmpty ? items : filteredItems,
        toggleFav: toggleFavourite,
        isFav: isFav,
        isCart: isCart,
        toggleCart: toggleCart);
    return params;
  }
}
