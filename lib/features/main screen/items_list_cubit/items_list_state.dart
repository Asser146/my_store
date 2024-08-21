part of 'items_list_cubit.dart';

abstract class ItemsListState extends Equatable {
  const ItemsListState();

  @override
  List<Object> get props => [];
}

class ItemsListStateInitial extends ItemsListState {}

class ItemsListStateLoading extends ItemsListState {}

class ItemsListStateLoaded extends ItemsListState {
  final List<Item> itemsList, cartItems, favorites;

  const ItemsListStateLoaded(
      {required this.itemsList,
      required this.favorites,
      required this.cartItems});

  @override
  List<Object> get props => [itemsList, favorites, cartItems];
}

class ItemsListStateError extends ItemsListState {
  final String message;

  const ItemsListStateError({required this.message});

  @override
  List<Object> get props => [message];
}

class ItemsListStateLimitLoaded extends ItemsListState {
  final List<Item> itemsList;

  const ItemsListStateLimitLoaded({required this.itemsList});

  @override
  List<Object> get props => [itemsList];
}
