import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/core/helpers/item_list_params.dart';
import 'package:my_store/features/main_screen/data/item.dart';
import 'package:my_store/core/widgets/item_card_list/items_list_operations.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> with ItemsListOperations {
  List<Item> filteredItems = [];

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

  Future<void> toggleSearchFavourite(Item item) async {
    emit(SearchLoading());
    await toggleFavourite(item);
    emit(SearchLoaded(items: items, fav: favourites, cart: cartItems));
  }

  Future<void> toggleSearchCart(Item item, int direction) async {
    emit(SearchLoading());
    await toggleCart(item, direction);
    emit(SearchLoaded(items: items, fav: favourites, cart: cartItems));
  }

  bool isSearchFavourite(Item item) {
    emit(SearchLoading());
    return isFav(item);
  }

  bool isSearchCart(Item item) {
    emit(SearchLoading());
    return isCart(item);
  }

  ItemsListParams get params {
    searchInit();
    return ItemsListParams(
      list: filteredItems,
      toggleFav: toggleSearchFavourite,
      isFav: isSearchFavourite,
      isCart: isSearchCart,
      toggleCart: toggleSearchCart,
    );
  }
}
