import 'package:my_store/core/di/dependency_injection.dart';
import 'package:my_store/core/networking/api_service.dart';
import 'package:my_store/features/main%20screen/data/item.dart';

class ItemRepository {
  Future<List<Item>> fetchAllProducts() async {
    try {
      ApiService client = getIt<ApiService>();
      final products = await client.getAllProducts();
      return products;
    } catch (e) {
      print('Error fetching products: $e');
      rethrow;
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
