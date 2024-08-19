import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'item_card_state.dart';

class ItemCardCubit extends Cubit<ItemCardState> {
  ItemCardCubit() : super(ItemCardInitial());

  bool _isFavorite = false;

  void clickFav() {
    _isFavorite = !_isFavorite;
    emit(ItemCardFavourite(favorite: _isFavorite));
  }
}
