import 'package:flutter/material.dart';
import 'package:my_store/features/Home/data/item.dart';

class ItemCardProvider extends ChangeNotifier {
  List<Item> _favorites = [];
  List<Item> _cartItems = [];

  List<Item> get favorites => _favorites;
  List<Item> get cartItems => _cartItems;

  void toggleFavorite(Item item) {
    if (_favorites.contains(item)) {
      _favorites.remove(item);
    } else {
      _favorites.add(item);
    }
    notifyListeners();
  }

  void toggleCart(Item item) {
    if (_cartItems.contains(item)) {
      _cartItems.remove(item);
    } else {
      _cartItems.add(item);
    }
    notifyListeners();
  }

  bool isFavorite(Item item) {
    return _favorites.contains(item);
  }

  bool inCart(Item item) {
    return _cartItems.contains(item);
  }
}
