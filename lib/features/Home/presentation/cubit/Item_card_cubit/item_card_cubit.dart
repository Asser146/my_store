import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'item_card_state.dart';

class ItemCardCubit extends Cubit<ItemCardState> {
  ItemCardCubit() : super(ItemCardInitial());
  bool favorite = true;
  bool selected = false;
  void clickFav() {
    favorite = !favorite;
    emit(ItemCardFavourite(favorite: favorite));
  }
}
