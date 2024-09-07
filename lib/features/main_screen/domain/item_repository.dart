import 'package:my_store/core/di/dependency_injection.dart';
import 'package:my_store/core/networking/api_service.dart';
import 'package:my_store/features/main_screen/data/base_response.dart';
import 'package:my_store/features/main_screen/data/item.dart';
import 'package:my_store/features/main_screen/domain/hive_services.dart';

class ItemRepository {
  final HiveServices _hiveServices = getIt<HiveServices>();
  List<Item> items = [], fav = [], cart = [];

  Future<void> fetchAllProducts() async {
    _hiveServices.init();
    // _hiveServices.clearBoxes();
    items = _hiveServices.items;

    if (items.isEmpty) {
      await _hiveServices.addItems(items);
    } else {
      fav = _hiveServices.favorites;
      cart = _hiveServices.cartItems;
    }
    try {
      ApiService client = getIt<ApiService>();
      BaseResponse response = await client.getAllProducts();

      items = response.items ?? [];
      print('Received categories: $items');
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

      // Initialize an empty list to store category names
      List<String> categoriesNames = [];
      print('Received categories: $categories');
      // Extract the name from each category object and add it to the list
      for (var category in categories) {
        categoriesNames.add(category.name ?? "NA");
      }

      return categoriesNames;
    } catch (e) {
      print('Error fetching categories: $e');
      rethrow; // Rethrow the error after logging it
    }
  }

  // Future<List<Item>> limit5Products() async {
  //   try {
  //     ApiService client = getIt<ApiService>();
  //     final products = await client.limit5Products();
  //     return products;
  //   } catch (e) {
  //     print('Error fetching products: $e');
  //     rethrow;
  //   }
  // }
}
