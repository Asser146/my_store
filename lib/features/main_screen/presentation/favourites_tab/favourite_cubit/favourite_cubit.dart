import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/features/main_screen/data/item.dart';
import 'package:my_store/core/widgets/items_list_operations.dart';

part 'favourite_state.dart';

class FavouriteCubit extends Cubit<FavouriteState> with ItemsListOperations {
  FavouriteCubit() : super(FavouriteStateInitial());

  Future<void> favouritesInit() async {
    emit(FavouriteStateInitial());
    init();
    emit(FavouriteStateItems(items: items, fav: favourites, cart: cartItems));
  }

  Future<void> favouritesToggleFav(Item item) async {
    emit(FavouriteStateLoading());
    toggleFavourite(item);
    emit(FavouriteStateItems(items: items, fav: favourites, cart: cartItems));
  }

  bool isFavourite(Item item) {
    return favourites.contains(item);
  }

  Future<void> favouritesToggleCart(Item item) async {
    emit(FavouriteStateLoading());
    toggleCart(item);
    emit(FavouriteStateItems(items: items, fav: favourites, cart: cartItems));
  }

  bool isCart(Item item) {
    return cartItems.contains(item);
  }
}
