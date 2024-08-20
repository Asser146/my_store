import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/core/di/dependency_injection.dart';
import 'package:my_store/features/Home/data/item.dart';
import 'package:my_store/features/Home/domain/item_repository.dart';

part 'items_list_state.dart';

class ItemsListCubit extends Cubit<ItemsListState> {
  late final List<Item> itemsList, favList, cartList;
  late final ItemRepository repo;
  final Set<String> _favorites = {}; // Keep track of favorite items

  ItemsListCubit() : super(ItemsListStateInitial());

  Future<void> init() async {
    favList = [];
    cartList = [];
    try {
      emit(ItemsListStateLoading());
      repo = getIt<ItemRepository>();
      itemsList = await repo.fetchAllProducts();
      emit(ItemsListStateLoaded(itemsList: itemsList, favorites: _favorites));
    } catch (e) {
      emit(const ItemsListStateError(message: 'Failed to load items'));
    }
  }

  void toggleFavorite(Item item) {
    emit(ItemsListStateLoading());
    if (_favorites.contains(item.id.toString())) {
      _favorites.remove(item.id.toString());
      favList.remove(item);
    } else {
      favList.add(item);
      _favorites.add(item.id.toString());
    }
    emit(ItemsListStateLoaded(itemsList: itemsList, favorites: _favorites));
  }

  bool isFavorite(String itemId) {
    return _favorites.contains(itemId);
  }

  void toggleCart(Item item) {
    emit(ItemsListStateLoading());
    if (cartList.contains(item)) {
      cartList.remove(item);
    } else {
      cartList.add(item);
    }
    emit(ItemsListStateLoaded(itemsList: itemsList, favorites: _favorites));
  }

  bool inCart(Item item) {
    return cartList.contains(item);
  }
}
