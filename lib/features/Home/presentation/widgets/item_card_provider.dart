import 'package:flutter/material.dart';
import 'package:my_store/core/di/dependency_injection.dart';
import 'package:my_store/features/Home/data/item.dart';
import 'package:my_store/features/Home/domain/item_repository.dart';
import 'package:my_store/features/main%20screen/domain/hive_services.dart';

class ItemCardProvider extends ChangeNotifier {
  List<Item> _favorites = [];
  List<Item> _cartItems = [];
  List<Item> _items = [];
  late final ItemRepository repo;
  late HiveServices _hiveServices;

  List<Item> get favorites => _favorites;
  List<Item> get cartItems => _cartItems;
  List<Item> get items => _items;

  ItemCardProvider() {
    _initialize();
  }

  Future<void> _initialize() async {
    repo = getIt<ItemRepository>();

    // Fetch items from repository
    _hiveServices = HiveServices();
    _items = await _hiveServices.getItems();
    if (_items.isEmpty) {
      _items = await repo.fetchAllProducts();
      await _hiveServices.addItems(_items);
      print("Fetched from Api");
    } else {
      print("Already Fetched");
      _favorites = _hiveServices.getFavorites(); // Load favorites from Hive
      _cartItems = _hiveServices.getCartItems();
    }

    // Load cart items from Hive
    notifyListeners();
  }

  void toggleFavorite(Item item) {
    if (isFavorite(item)) {
      _favorites.remove(item);
    } else {
      _favorites.add(item);
    }
    _hiveServices.toggleFavorite(item); // Persist changes to Hive
    notifyListeners();
  }

  void toggleCart(Item item) {
    if (inCart(item)) {
      _cartItems.remove(item);
    } else {
      _cartItems.add(item);
    }
    _hiveServices.toggleCartItem(item); // Persist changes to Hive
    notifyListeners();
  }

  bool isFavorite(Item item) {
    return _favorites.contains(item);
  }

  bool inCart(Item item) {
    return _cartItems.contains(item);
  }
}
