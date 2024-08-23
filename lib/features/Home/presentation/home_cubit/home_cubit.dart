import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeStateInitial());
  int currentTabIndex = 0;
  void changeTab(int index) {
    currentTabIndex = index;
    emit(HomeStateTabChanged(index: currentTabIndex));
  }
}
