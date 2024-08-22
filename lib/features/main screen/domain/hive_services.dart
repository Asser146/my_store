import 'package:hive/hive.dart';
import 'package:my_store/features/Home/data/item.dart';

class HiveServices {
  static final HiveServices _instance = HiveServices._internal();
  late Box<Item> _favoritesBox;
  late Box<Item> _cartBox;
  late Box<Item> _itemsBox;

  factory HiveServices() {
    return _instance;
  }

  HiveServices._internal();

  Future<void> init() async {
    _itemsBox = await Hive.openBox<Item>('itemsBox');
    _favoritesBox = await Hive.openBox<Item>('favoritesBox');
    _cartBox = await Hive.openBox<Item>('cartBox');
  }

  List<Item> getItems() {
    return _itemsBox.values.toList();
  }

  Future<void> addItems(List<Item> itemsList) async {
    for (Item item in itemsList) {
      await _itemsBox.put(item.id, item);
    }
  }

  // Favorite Items Methods
  bool isFavorite(Item item) {
    return _favoritesBox.containsKey(item.id);
  }

  Future<void> toggleFavorite(Item item) async {
    if (isFavorite(item)) {
      await _favoritesBox.delete(item.id);
    } else {
      await _favoritesBox.put(item.id, item.copyWith());
    }
  }

  List<Item> getFavorites() {
    return _favoritesBox.values.toList();
  }

  // Cart Items Methods
  bool isInCart(Item item) {
    return _cartBox.containsKey(item.id);
  }

  Future<void> toggleCartItem(Item item) async {
    if (isInCart(item)) {
      await _cartBox.delete(item.id);
    } else {
      await _cartBox.put(item.id, item.copyWith());
    }
  }

  List<Item> getCartItems() {
    return _cartBox.values.toList();
  }

  Future<void> clearFavorites() async {
    await _favoritesBox.clear();
  }

  Future<void> clearCartItems() async {
    await _cartBox.clear();
  }

  Future<void> clearItems() async {
    await _itemsBox.clear();
  }
}
