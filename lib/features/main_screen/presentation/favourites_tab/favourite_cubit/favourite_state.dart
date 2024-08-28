part of 'favourite_cubit.dart';

abstract class FavouriteState extends Equatable {
  const FavouriteState();

  @override
  List<Object> get props => [];
}

class FavouriteStateInitial extends FavouriteState {}

class FavouriteStateLoading extends FavouriteState {}

class FavouriteStateItems extends FavouriteState {
  final List<Item> items, fav, cart;
  const FavouriteStateItems(
      {required this.items, required this.fav, required this.cart});

  @override
  List<Object> get props => [items, fav, cart];
}
