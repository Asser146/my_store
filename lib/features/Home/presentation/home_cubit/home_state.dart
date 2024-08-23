part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeStateInitial extends HomeState {}

class HomeStateTabChanged extends HomeState {
  final int index;
  const HomeStateTabChanged({required this.index});

  @override
  List<Object> get props => [index];
}
