import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/features/main_screen/data/item.dart';
import 'package:my_store/core/widgets/items_list_operations.dart';

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
      emit(SearchInitial());
    } else {
      filteredItems = items.where((item) {
        return item.title?.toLowerCase().contains(query.toLowerCase()) ?? false;
      }).toList();
      emit(
          SearchLoaded(items: filteredItems, fav: favourites, cart: cartItems));
    }
  }

  Future<void> searchToggleFav(Item item) async {
    emit(SearchLoading());
    toggleFavourite(item);
    emit(SearchLoaded(items: items, fav: favourites, cart: cartItems));
  }

  bool isFavourite(Item item) {
    return favourites.contains(item);
  }

  Future<void> searchToggleCart(Item item) async {
    emit(SearchLoading());
    toggleCart(item);
    emit(SearchLoaded(items: items, fav: favourites, cart: cartItems));
  }

  bool isCart(Item item) {
    return cartItems.contains(item);
  }
}
