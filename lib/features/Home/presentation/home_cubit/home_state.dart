part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeStateInitial extends HomeState {}

class HomeStateLoading extends HomeState {}

class HomeStateItems extends HomeState {
  final List<Item> items, fav, cart;
  const HomeStateItems(
      {required this.items, required this.fav, required this.cart});

  @override
  List<Object> get props => [items, fav, cart];
}

class HomeStateTabChanged extends HomeState {
  final int index;
  const HomeStateTabChanged({required this.index});

  @override
  List<Object> get props => [index];
}
