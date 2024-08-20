part of 'items_list_cubit.dart';

abstract class ItemsListState extends Equatable {
  const ItemsListState();

  @override
  List<Object> get props => [];
}

class ItemsListStateInitial extends ItemsListState {}

class ItemsListStateLoading extends ItemsListState {}

class ItemsListStateLoaded extends ItemsListState {
  const ItemsListStateLoaded({required this.itemsList});
  final List<Item> itemsList;

  @override
  List<Object> get props => [];
}

class ItemsListStateError extends ItemsListState {
  const ItemsListStateError({required this.message});
  final String message;

  @override
  List<Object> get props => [];
}
