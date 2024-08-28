import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/core/di/dependency_injection.dart';
import 'package:my_store/features/main_screen/data/item.dart';
import 'package:my_store/features/main_screen/domain/item_repository.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final ItemRepository repo = getIt<ItemRepository>();
  List<List<Item>> lists = [];
  List<Item> items = [], favourites = [], cartitems = [];
  List<Item> filteredItems = [];

  SearchCubit() : super(SearchInitial()) {
    init();
  }
  Future<void> init() async {
    emit(SearchLoading());
    lists = await repo.getLists();
    items = lists[0];
    favourites = lists[1];
    cartitems = lists[2];
    emit(SearchLoaded(items: items, fav: favourites, cart: cartitems));
  }

  void search(List<Item> items, String query) {
    if (query.isEmpty) {
      emit(SearchInitial());
    } else {
      filteredItems = items.where((item) {
        return item.title?.toLowerCase().contains(query.toLowerCase()) ?? false;
      }).toList();
      emit(
          SearchLoaded(items: filteredItems, fav: favourites, cart: cartitems));
    }
  }

  Future<void> toggleFavorite(Item item) async {
    emit(SearchLoading());
    if (favourites.contains(item)) {
      favourites.remove(item);
    } else {
      favourites.add(item);
    }
    await repo.toggleFav(item);
    emit(SearchLoaded(items: items, fav: favourites, cart: cartitems));
  }

  bool isFavourite(Item item) {
    return favourites.contains(item);
  }

  Future<void> toggleCart(Item item) async {
    emit(SearchLoading());
    if (cartitems.contains(item)) {
      cartitems.remove(item);
    } else {
      cartitems.add(item);
    }
    await repo.toggleCart(item);
    emit(SearchLoaded(items: items, fav: favourites, cart: cartitems));
  }

  bool isCart(Item item) {
    return cartitems.contains(item);
  }
}
