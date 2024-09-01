part of 'item_details_cubit.dart';

@freezed
class ItemDetailsState with _$ItemDetailsState {
  const factory ItemDetailsState.initial() = _Initial;
  const factory ItemDetailsState.toggleFav() = _ToggleItemFav;
  const factory ItemDetailsState.toggleCart() = _ToggleItemCart;
}
