part of 'bottom_bar_cubit.dart';

abstract class BottomBarState extends Equatable {
  const BottomBarState();

  @override
  List<Object> get props => [];
}

final class BottomBarHomeSelected extends BottomBarState {}

final class BottomBarSearchSelected extends BottomBarState {}

final class BottomBarCartSelected extends BottomBarState {}

final class BottomBarFavouritesSelected extends BottomBarState {}
