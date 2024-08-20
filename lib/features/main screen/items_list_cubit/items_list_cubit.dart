import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/core/di/dependency_injection.dart';
import 'package:my_store/features/Home/data/item.dart';
import 'package:my_store/features/Home/domain/item_repository.dart';

part 'items_list_state.dart';

class ItemsListCubit extends Cubit<ItemsListState> {
  late final List<Item> itemsList;
  late final ItemRepository repo;
  final Set<String> _favorites = {}; // Keep track of favorite items

  ItemsListCubit() : super(ItemsListStateInitial());

  Future<void> init() async {
    try {
      emit(ItemsListStateLoading());
      repo = getIt<ItemRepository>();
      itemsList = await repo.fetchAllProducts();
      emit(ItemsListStateLoaded(itemsList: itemsList, favorites: _favorites));
    } catch (e) {
      emit(ItemsListStateError(message: 'Failed to load items'));
    }
  }

  void toggleFavorite(String itemId) {
    emit(ItemsListStateLoading());
    if (_favorites.contains(itemId)) {
      _favorites.remove(itemId);
    } else {
      _favorites.add(itemId);
    }
    emit(ItemsListStateLoaded(itemsList: itemsList, favorites: _favorites));
  }

  bool isFavorite(String itemId) {
    return _favorites.contains(itemId);
  }
}
