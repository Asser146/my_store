import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/core/di/dependency_injection.dart';
import 'package:my_store/features/main%20screen/data/item.dart';
import 'package:my_store/features/main%20screen/presentation/widgets/item_card_provider.dart';

part 'main_screen_state.dart';

class MainScreenCubit extends Cubit<MainScreenState> {
  final ItemCardProvider provider = getIt<ItemCardProvider>();
  var currentIndex = 0;
  MainScreenCubit() : super(MainScreenInitial());

  void changeTab(int index) {
    emit(MainScreenTabChanged(index: index));
  }

  void updateCategory(int index) {
    currentIndex = index;
  }

  void search(List<Item> items, String query) {
    if (query.isEmpty) {
      emit(MainScreenInitial());
    } else {
      final filteredItems = items.where((item) {
        return item.title?.toLowerCase().contains(query.toLowerCase()) ?? false;
      }).toList();
      emit(MainScreenSearchLoaded(itemsList: filteredItems));
    }
  }
}
