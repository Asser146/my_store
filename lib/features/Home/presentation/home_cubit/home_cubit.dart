import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/core/di/dependency_injection.dart';
import 'package:my_store/features/main%20screen/presentation/widgets/item_card_provider.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeStateInitial());
  final ItemCardProvider provider = getIt<ItemCardProvider>();
  int currentTabIndex = 0;
  void changeTab(int index) {
    currentTabIndex = index;
    emit(HomeStateTabChanged(index: currentTabIndex));
  }
}
