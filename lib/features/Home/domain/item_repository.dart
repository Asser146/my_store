import 'package:my_store/core/di/dependency_injection.dart';
import 'package:my_store/core/networking/api_service.dart';
import 'package:my_store/features/Home/data/item.dart';

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
}
