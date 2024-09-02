part of 'item_details_cubit.dart';

class ItemDetailsState extends Equatable {
  const ItemDetailsState();

  @override
  List<Object> get props => [];
}

class ItemDetailsInitial extends ItemDetailsState {}

class ItemDetailsValues extends ItemDetailsState {
  final Item item;
  final bool isFav, isCart;
  const ItemDetailsValues(
      {required this.item, required this.isFav, required this.isCart});

  @override
  List<Object> get props => [item, isFav, isCart];
}
