import 'package:hive/hive.dart';
import 'package:my_store/features/main_screen/data/item.dart';

class HiveServices {
  static final HiveServices _instance = HiveServices._internal();
  late Box<Item> _favoritesBox;
  late Box<Item> _cartBox;
  late Box<Item> _itemsBox;
  late Box<int> _quantityBox;

  factory HiveServices() {
    return _instance;
  }

  HiveServices._internal();

  Future<void> init() async {
    // Make sure you register the adapter before opening the box
    if (!Hive.isAdapterRegistered(ItemAdapter().typeId)) {
      Hive.registerAdapter(ItemAdapter());
    }

    _itemsBox = await Hive.openBox<Item>('itemsBox');
    _favoritesBox = await Hive.openBox<Item>('favoritesBox');
    _cartBox = await Hive.openBox<Item>('cartBox');
    _quantityBox = await Hive.openBox<int>('quantityBox');
  }

  void clearCart() {
    _cartBox.deleteAll(cartItems);
    _quantityBox.clear();
  }

  List<Item> get items {
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

  List<Item> get favorites {
    return _favoritesBox.values.toList();
  }

  // Cart Items Methods
  bool isInCart(Item item) {
    return _cartBox.containsKey(item.id);
  }

  Future<void> toggleCartItem(Item item, int direction) async {
    if (direction > 0) {
      if (isInCart(item)) {
        await _quantityBox.put(item.id!, _quantityBox.get(item.id)! + 1);
      } else {
        await _cartBox.put(item.id, item.copyWith());
        await _quantityBox.put(item.id!, 1);
      }
    } else {
      if (_quantityBox.containsKey(item.id)) {
        await _quantityBox.put(item.id!, _quantityBox.get(item.id)! - 1);
      }
      if (_quantityBox.get(item.id) == 0) {
        await _cartBox.delete(item.id);
        await _quantityBox.delete(item.id);
      }
    }
  }

  int getQuantity(int itemId) {
    return _quantityBox.get(itemId, defaultValue: 0)!;
  }

  List<Item> get cartItems {
    return _cartBox.values.toList();
  }

  Future<void> clearBoxes() async {
    await _favoritesBox.clear();
    await _cartBox.clear();
    await _itemsBox.clear();
    await _quantityBox.clear();
  }
}
