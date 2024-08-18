import 'package:bloc/bloc.dart';
part 'item_card_state.dart';

class ItemCardCubit extends Cubit<ItemCardState> {
  ItemCardCubit() : super(ItemCardInitial());
}
