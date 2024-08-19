import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'bottom_bar_state.dart';

class BottomBarCubit extends Cubit<BottomBarState> {
  BottomBarCubit() : super(BottomBarHomeSelected());

  void updateIndex(int newIndex) {
    switch (newIndex) {
      case 0:
        emit(BottomBarHomeSelected());
        break;
      case 1:
        emit(BottomBarSearchSelected());
        break;
      case 2:
        emit(BottomBarCartSelected());
        break;
      default:
        emit(BottomBarHomeSelected());
        break;
    }
  }
}
