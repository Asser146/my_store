import 'package:my_store/core/di/dependency_injection.dart';
import 'package:my_store/core/networking/api_service.dart';
import 'package:my_store/features/main_screen/data/item.dart';
import 'package:my_store/features/main_screen/domain/hive_services.dart';

class ItemRepository {
  final HiveServices _hiveServices = getIt<HiveServices>();
  List<Item> items = [], fav = [], cart = [];

  Future<void> fetchAllProducts() async {
    _hiveServices.init();
    items = _hiveServices.items;

    if (items.isEmpty) {
      await _hiveServices.addItems(items);
    } else {
      fav = _hiveServices.favorites;
      cart = _hiveServices.cartItems;
    }
    try {
      ApiService client = getIt<ApiService>();
      items = await client.getAllProducts();
    } catch (e) {
      print('Error fetching products: $e');
      rethrow;
    }
  }

  void removeCart() {
    _hiveServices.clearCart();
  }

  Future<void> toggleFav(Item item) async {
    _hiveServices.toggleFavorite(item);
  }

  Future<void> toggleCart(Item item, int direction) async {
    _hiveServices.toggleCartItem(item, direction);
  }

  int getQuantity(int itemId) {
    return _hiveServices.getQuantity(itemId) ?? 0;
  }

  Future<List<List<Item>>> getLists() async {
    items.isEmpty ? fetchAllProducts() : null;
    return [items, fav, cart];
  }

  Future<List<String>> getCategories() async {
    try {
      ApiService client = getIt<ApiService>();
      final categories = await client.getCategories();
      return categories;
    } catch (e) {
      print('Error fetching categories: $e');
      rethrow;
    }
  }

  Future<List<Item>> limit5Products() async {
    try {
      ApiService client = getIt<ApiService>();
      final products = await client.limit5Products();
      return products;
    } catch (e) {
      print('Error fetching products: $e');
      rethrow;
    }
  }
}
