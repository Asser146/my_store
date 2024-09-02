part of 'item_details_cubit.dart';

abstract class ItemDetailsState extends Equatable {
  const ItemDetailsState();

  @override
  List<Object> get props => [];
}

class ItemDetailsStateInitial extends ItemDetailsState {}

class ItemDetailsStateLoading extends ItemDetailsState {}

class ItemDetailsStateItems extends ItemDetailsState {
  final List<Item> items;
  final bool fav, cart;
  const ItemDetailsStateItems(
      {required this.items, required this.fav, required this.cart});

  @override
  List<Object> get props => [items, fav, cart];
}
