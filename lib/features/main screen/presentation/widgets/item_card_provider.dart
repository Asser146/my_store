import 'package:flutter/material.dart';
import 'package:my_store/core/di/dependency_injection.dart';
import 'package:my_store/features/main%20screen/data/item.dart';
import 'package:my_store/features/main%20screen/domain/item_repository.dart';
import 'package:my_store/features/main%20screen/domain/hive_services.dart';

class ItemCardProvider extends ChangeNotifier {
  static final ItemCardProvider _instance = ItemCardProvider._internal();

  List<Item> _favorites = [];
  List<Item> _cartItems = [];
  List<Item> _items = [];
  List<String> categories = ["ALL"];
  late final ItemRepository repo;
  late HiveServices _hiveServices;

  // Private constructor
  ItemCardProvider._internal() {
    _initialize();
  }

  // Factory constructor returns the same instance
  factory ItemCardProvider() {
    return _instance;
  }

  List<Item> get favorites => _favorites;
  List<Item> get cartItems => _cartItems;
  List<Item> get items => _items;

  Future<void> _initialize() async {
    repo = getIt<ItemRepository>();

    _hiveServices = HiveServices();
    _items = _hiveServices.getItems();
    if (_items.isEmpty) {
      _items = await repo.fetchAllProducts();
      await _hiveServices.addItems(_items);
    } else {
      _favorites = _hiveServices.getFavorites();
      _cartItems = _hiveServices.getCartItems();
    }
    final List<String> cat = await repo.getCategories();
    categories.addAll(cat);
    notifyListeners();
  }

  void toggleFavorite(Item item) {
    if (isFavorite(item)) {
      _favorites.remove(item);
    } else {
      _favorites.add(item);
    }
    _hiveServices.toggleFavorite(item);
    notifyListeners();
  }

  void toggleCart(Item item) {
    if (inCart(item)) {
      _cartItems.remove(item);
    } else {
      _cartItems.add(item);
    }
    _hiveServices.toggleCartItem(item);
    notifyListeners();
  }

  bool isFavorite(Item item) {
    return _favorites.contains(item);
  }

  bool inCart(Item item) {
    return _cartItems.contains(item);
  }
}
