part of 'item_card_cubit.dart';

abstract class ItemCardState extends Equatable {
  @override
  List<Object> get props => [];
}

final class ItemCardInitial extends ItemCardState {}

final class ItemCardFavourite extends ItemCardState {
  ItemCardFavourite({required this.favorite});
  final bool favorite;

  @override
  List<Object> get props => [favorite];
}

final class ItemCardSelected extends ItemCardState {}
