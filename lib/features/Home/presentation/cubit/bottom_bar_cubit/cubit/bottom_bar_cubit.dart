import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'bottom_bar_state.dart';

class BottomBarCubit extends Cubit<BottomBarState> {
  BottomBarCubit() : super((BottomBarHomeSelected()));
  void chooseTab(int index) {
    if (index == 0) {
      emit(BottomBarHomeSelected());
    } else if (index == 1) {
      emit(BottomBarSearchSelected());
    } else {
      emit(BottomBarCartSelected());
    }
  }
}
