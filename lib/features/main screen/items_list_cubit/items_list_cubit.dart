import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:my_store/core/di/dependency_injection.dart';
import 'package:my_store/features/Home/data/item.dart';
import 'package:my_store/features/Home/domain/item_repository.dart';

part 'items_list_state.dart';

class ItemsListCubit extends Cubit<ItemsListState> {
  List<Item> itemsList = [];
  List<Item> favList = [];
  List<Item> cartList = [];
  late final ItemRepository repo;
  final Box<Item> _itemsBox = Hive.box<Item>('itemsBox');
  final Box<Item> _favoritesBox = Hive.box<Item>('favoritesBox');
  final Box<Item> _cartBox = Hive.box<Item>('cartBox');

  ItemsListCubit() : super(ItemsListStateInitial());

  Future<void> init() async {
    try {
      emit(ItemsListStateLoading());
      repo = getIt<ItemRepository>();

      // Load items from Hive if available
      final storedItems = _itemsBox.values.toList();
      if (storedItems.isNotEmpty) {
        print("Loaded items from Hive");
        itemsList = storedItems;

        // Load favorites and cart items from Hive
        favList = _favoritesBox.values.toList();
        cartList = _cartBox.values.toList();

        print("Loaded favorites from Hive: ${favList.length} items");
        emit(ItemsListStateLoaded(
            itemsList: itemsList, favorites: favList, cartItems: cartList));
      } else {
        print("No items found in Hive, fetching from repository");

        // Fetch items from repository if not in Hive
        itemsList = await repo.fetchAllProducts();
        _itemsBox.addAll(itemsList);
        emit(ItemsListStateLoaded(
            itemsList: itemsList, favorites: favList, cartItems: cartList));
      }
    } catch (e) {
      emit(const ItemsListStateError(message: 'Failed to load items'));
    }
  }

  Future<void> limit5Products() async {
    try {
      emit(ItemsListStateLoading());
      itemsList = await repo.limit5Products();
      _itemsBox.addAll(itemsList);
      emit(ItemsListStateLoaded(
          itemsList: itemsList, favorites: favList, cartItems: cartList));
    } catch (e) {
      emit(const ItemsListStateError(message: 'Failed to load items'));
    }
  }

  void toggleFavorite(Item item) {
    emit(ItemsListStateLoading());
    if (favList.contains(item)) {
      favList.remove(item);
    } else {
      favList.add(item);
    }
    _favoritesBox.put('favorites', item); // Store favorites as a list in Hive
    emit(ItemsListStateLoaded(
        itemsList: itemsList, favorites: favList, cartItems: cartList));
  }

  bool isFavorite(Item item) {
    return favList.contains(item);
  }

  void toggleCart(Item item) {
    emit(ItemsListStateLoading());
    if (cartList.contains(item)) {
      cartList.remove(item);
      _cartBox.delete(item.id);
    } else {
      cartList.add(item);
      _cartBox.put(item.id, item);
    }
    emit(ItemsListStateLoaded(
        itemsList: itemsList, favorites: favList, cartItems: cartList));
  }

  bool inCart(Item item) {
    return cartList.contains(item);
  }

  void deleteBoxes() {
    Hive.box('itemsBox').clear();
    Hive.box('favoritesBox').clear();
    Hive.box('cartBox').clear();
  }
}
