part of 'search_cubit.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {}

class SearchLoaded extends SearchState {
  final List<Item> itemsList;

  const SearchLoaded({required this.itemsList});

  @override
  List<Object> get props => [itemsList];
}
