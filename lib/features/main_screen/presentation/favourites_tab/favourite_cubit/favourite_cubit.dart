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
}
