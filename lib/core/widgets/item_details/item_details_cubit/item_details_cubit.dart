import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_store/core/widgets/item_card_list/items_list_operations.dart';
import 'package:my_store/features/main_screen/data/item.dart';

part 'item_details_state.dart';

class ItemDetailsCubit extends Cubit<ItemDetailsState>
    with ItemsListOperations {
  final Item item;

  ItemDetailsCubit(this.item) : super(ItemDetailsStateInitial()) {
    detailsInit();
  }

  Future<void> detailsInit() async {
    init();
    emit(ItemDetailsStateItems(
        items: items, fav: isFav(item), cart: isCart(item)));
  }

  Future<void> toggleDetailsFavourite(Item item) async {
    emit(ItemDetailsStateLoading());
    await toggleFavourite(item);
    emit(ItemDetailsStateItems(
        items: items, fav: isFav(item), cart: isCart(item)));
  }

  Future<void> toggleDetailsCart(Item item, int direction) async {
    emit(ItemDetailsStateLoading());
    await toggleCart(item, direction);
    emit(ItemDetailsStateItems(
        items: items, fav: isFav(item), cart: isCart(item)));
  }

  bool isDetailsFavourite(Item item) {
    emit(ItemDetailsStateLoading());
    return isFav(item);
  }

  bool isDetailsCart(Item item) {
    emit(ItemDetailsStateLoading());
    return isCart(item);
  }

  void toggleQuantity(Item item, int direction) {
    toggleCart(item, direction);
    emit(ItemDetailsStateItems(
        items: items, fav: isFav(item), cart: isCart(item)));
  }

  int getDetailsQuantity(int itemId) {
    return getQuantity(itemId);
  }
}
