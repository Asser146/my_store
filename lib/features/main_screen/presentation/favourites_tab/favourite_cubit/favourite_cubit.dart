import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/core/helpers/item_list_params.dart';
import 'package:my_store/features/main_screen/data/item.dart';
import 'package:my_store/core/widgets/item_card_list/items_list_operations.dart';

part 'favourite_state.dart';

class FavouriteCubit extends Cubit<FavouriteState> with ItemsListOperations {
  FavouriteCubit() : super(FavouriteStateInitial());

  Future<void> favouritesInit() async {
    emit(FavouriteStateInitial());
    init();
    emit(FavouriteStateItems(items: items, fav: favourites, cart: cartItems));
  }

  Future<void> toggleFavScreenFavourite(Item item) async {
    emit(FavouriteStateLoading());
    await toggleFavourite(item);
    emit(FavouriteStateItems(items: items, fav: favourites, cart: cartItems));
  }

  Future<void> togglefavScreenCart(Item item, int direction) async {
    emit(FavouriteStateLoading());
    await toggleCart(item, direction);
    emit(FavouriteStateItems(items: items, fav: favourites, cart: cartItems));
  }

  bool isFavScreenFavourite(Item item) {
    emit(FavouriteStateLoading());
    return isFav(item);
  }

  bool isFavScreenCart(Item item) {
    emit(FavouriteStateLoading());
    return isCart(item);
  }

  ItemsListParams get params {
    favouritesInit();
    return ItemsListParams(
      list: favourites,
      toggleFav: toggleFavScreenFavourite,
      isFav: isFavScreenFavourite,
      isCart: isFavScreenCart,
      toggleCart: togglefavScreenCart,
    );
  }
}
