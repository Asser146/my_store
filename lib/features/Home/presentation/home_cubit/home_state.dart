part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeStateInitial extends HomeState {}

class HomeStateLoading extends HomeState {}

class HomeStateLoaded extends HomeState {
  final List<Item> itemsList;

  const HomeStateLoaded({required this.itemsList});

  @override
  List<Object> get props => [itemsList];
}

class HomeStateError extends HomeState {
  final String message;

  const HomeStateError({required this.message});

  @override
  List<Object> get props => [message];
}
