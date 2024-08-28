part of 'main_screen_cubit.dart';

abstract class MainScreenState extends Equatable {
  const MainScreenState();

  @override
  List<Object> get props => [];
}

class MainScreenInitial extends MainScreenState {}

class MainScreenTabChanged extends MainScreenState {
  final int index;

  const MainScreenTabChanged({required this.index});

  @override
  List<Object> get props => [index];
}

class MainScreenSearchLoaded extends MainScreenState {
  final List<Item> itemsList;

  const MainScreenSearchLoaded({required this.itemsList});

  @override
  List<Object> get props => [itemsList];
}
