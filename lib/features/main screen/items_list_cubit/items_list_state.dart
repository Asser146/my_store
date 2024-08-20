part of 'items_list_cubit.dart';

abstract class ItemsListState extends Equatable {
  const ItemsListState();

  @override
  List<Object> get props => [];
}

class ItemsListStateInitial extends ItemsListState {}

class ItemsListStateLoading extends ItemsListState {}

class ItemsListStateLoaded extends ItemsListState {
  final List<Item> itemsList;
  final Set<String> favorites; // Add favorites set

  const ItemsListStateLoaded(
      {required this.itemsList, required this.favorites});

  @override
  List<Object> get props => [itemsList, favorites];
}

class ItemsListStateError extends ItemsListState {
  final String message;

  const ItemsListStateError({required this.message});

  @override
  List<Object> get props => [message];
}
