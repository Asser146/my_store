import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_store/core/helpers/item_list_params.dart';
import 'package:my_store/core/widgets/items_list_operations.dart';
import 'package:my_store/features/main_screen/data/item.dart';

part 'item_details_state.dart';

class ItemDetailsCubit extends Cubit<ItemDetailsState>
    with ItemsListOperations {
  final Item item;
  ItemDetailsCubit(this.item) : super(ItemDetailsStateInitial());

  Future<void> detailsInit() async {
    init();

    emit(ItemDetailsStateItems(items: items, fav: favourites, cart: cartItems));
  }

  Future<void> reInitialize() async {
    emit(ItemDetailsStateLoading());
    init();
    emit(ItemDetailsStateItems(items: items, fav: favourites, cart: cartItems));
  }

  ItemsListParams get params {
    return ItemsListParams(
        list: items,
        toggleFav: toggleFavourite,
        isFav: isFav,
        isCart: isCart,
        toggleCart: toggleCart,
        item: item);
  }
}
