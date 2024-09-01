import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_store/core/widgets/items_list_operations.dart';
import 'package:my_store/features/main_screen/data/item.dart';

part 'item_details_state.dart';
part 'item_details_cubit.freezed.dart';

class ItemDetailsCubit extends Cubit<ItemDetailsState>
    with ItemsListOperations {
  final Item item;
  ItemDetailsCubit({required this.item})
      : super(const ItemDetailsState.initial());

  void toggleDetailFav() {
    toggleFavourite(item);
    emit(const ItemDetailsState.toggleFav());
  }

  void toggleDetailsCart() {
    toggleCart(item);
    emit(const ItemDetailsState.toggleCart());
  }
}
