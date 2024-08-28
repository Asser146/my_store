import 'package:my_store/core/di/dependency_injection.dart';
import 'package:my_store/core/networking/api_service.dart';
import 'package:my_store/features/main%20screen/data/item.dart';
import 'package:my_store/features/main%20screen/domain/hive_services.dart';

class ItemRepository {
  final HiveServices _hiveServices = getIt<HiveServices>();
  List<Item> items = [], fav = [], cart = [];

  Future<void> fetchAllProducts() async {
    _hiveServices.init();
    items = _hiveServices.getItems();

    if (items.isEmpty) {
      await _hiveServices.addItems(items);
    } else {
      fav = _hiveServices.getFavorites();
      cart = _hiveServices.getCartItems();
    }
    try {
      ApiService client = getIt<ApiService>();
      items = await client.getAllProducts();
    } catch (e) {
      print('Error fetching products: $e');
      rethrow;
    }
  }

  Future<void> toggleFav(Item item) async {
    _hiveServices.toggleFavorite(item);
  }

  Future<List<List<Item>>> getLists() async {
    List<List<Item>> lists = [];
    if (items.isEmpty) {
      fetchAllProducts();
      lists.add(items);
      lists.add(fav);
      lists.add(cart);
      return lists;
    } else {
      lists.add(items);
      lists.add(fav);
      lists.add(cart);
      return lists;
    }
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
