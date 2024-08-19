part of 'item_card_cubit.dart';

abstract class ItemCardState extends Equatable {
  const ItemCardState();

  @override
  List<Object?> get props => [];
}

class ItemCardInitial extends ItemCardState {}

class ItemCardFavourite extends ItemCardState {
  final bool favorite;

  const ItemCardFavourite({required this.favorite});

  @override
  List<Object?> get props => [favorite];
}
