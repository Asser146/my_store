part of 'item_details_cubit.dart';

abstract class ItemDetailsState extends Equatable {
  const ItemDetailsState();

  @override
  List<Object> get props => [];
}

class ItemDetailsStateInitial extends ItemDetailsState {}

class ItemDetailsStateLoading extends ItemDetailsState {}

class ItemDetailsStateItems extends ItemDetailsState {
  final List<Item> items, fav, cart;
  const ItemDetailsStateItems(
      {required this.items, required this.fav, required this.cart});

  @override
  List<Object> get props => [items, fav, cart];
}

class ItemDetailsStateTabChanged extends ItemDetailsState {
  final int index;
  const ItemDetailsStateTabChanged({required this.index});

  @override
  List<Object> get props => [index];
}
