import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_store/core/widgets/items_list_operations.dart';
import 'package:my_store/features/main_screen/data/item.dart';

part 'item_details_state.dart';

class ItemDetailsCubit extends Cubit<ItemDetailsState>
    with ItemsListOperations {
  ItemDetailsCubit({required this.item}) : super(ItemDetailsInitial());

  final Item item;
  late bool isDetailsFav;
  late bool isDetailsCart;
  void detailsInit() {
    init();
    isDetailsFav = isFav(item);
    isDetailsCart = isCart(item);
    emit(ItemDetailsValues(
        item: item, isCart: isDetailsCart, isFav: isDetailsFav));
  }

  Future<void> toggleDetailsFavorite() async {
    await toggleFavourite(item);
    isDetailsFav = !isDetailsFav;
    emit(ItemDetailsValues(
        item: item, isCart: isDetailsCart, isFav: isDetailsFav));
  }

  Future<void> toggleDetailsCart() async {
    await toggleCart(item);
    isDetailsCart = !isDetailsCart;
    emit(ItemDetailsValues(
        item: item, isCart: isDetailsCart, isFav: isDetailsFav));
  }
}
