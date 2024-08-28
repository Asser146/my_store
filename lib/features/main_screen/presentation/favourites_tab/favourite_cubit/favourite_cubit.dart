import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/core/di/dependency_injection.dart';
import 'package:my_store/features/main_screen/data/item.dart';
import 'package:my_store/features/main_screen/domain/item_repository.dart';

part 'favourite_state.dart';

class FavouriteCubit extends Cubit<FavouriteState> {
  final List<String> categories = ["ALL"];
  final ItemRepository repo = getIt<ItemRepository>();
  List<List<Item>> lists = [];
  List<Item> items = [], favourites = [], cartItems = [];

  FavouriteCubit() : super(FavouriteStateInitial());
  Future<void> init() async {
    emit(FavouriteStateInitial());
    lists = await repo.getLists();
    items = lists[0];
    favourites = lists[1];
    cartItems = lists[2];

    emit(FavouriteStateItems(items: items, fav: favourites, cart: cartItems));
  }

  Future<void> toggleFavorite(Item item) async {
    emit(FavouriteStateLoading());
    if (favourites.contains(item)) {
      favourites.remove(item);
    } else {
      favourites.add(item);
    }
    await repo.toggleFav(item);
    emit(FavouriteStateItems(items: items, fav: favourites, cart: cartItems));
  }

  bool isFavourite(Item item) {
    return favourites.contains(item);
  }

  Future<void> toggleCart(Item item) async {
    emit(FavouriteStateLoading());
    if (cartItems.contains(item)) {
      cartItems.remove(item);
    } else {
      cartItems.add(item);
    }
    await repo.toggleCart(item);
    emit(FavouriteStateItems(items: items, fav: favourites, cart: cartItems));
  }

  bool isCart(Item item) {
    return cartItems.contains(item);
  }
}
