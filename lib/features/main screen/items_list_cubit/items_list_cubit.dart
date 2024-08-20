import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/core/di/dependency_injection.dart';
import 'package:my_store/features/Home/data/item.dart';
import 'package:my_store/features/Home/domain/item_repository.dart';

part 'items_list_state.dart';

class ItemsListCubit extends Cubit<ItemsListState> {
  late final List<Item> itemsList;
  late final ItemRepository repo;

  ItemsListCubit() : super(ItemsListStateInitial());

  Future<void> init() async {
    try {
      print("here");
      emit(ItemsListStateLoading());
      print("here2");
      repo = getIt<ItemRepository>();
      print("her3");

      itemsList = await repo.fetchAllProducts();
      print("here4");

      emit(ItemsListStateLoaded(itemsList: itemsList));
    } catch (e) {
      emit(ItemsListStateError(message: 'Failed to load items'));
    }
  }
}
