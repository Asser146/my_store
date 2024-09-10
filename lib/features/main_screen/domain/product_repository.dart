import 'package:my_store/core/di/dependency_injection.dart';
import 'package:my_store/core/networking/api_service.dart';
import 'package:my_store/features/main_screen/data/base_response.dart';
import 'package:my_store/features/main_screen/data/product.dart';
import 'package:my_store/features/main_screen/domain/hive_services.dart';

class ProductRepository {
  final HiveServices _hiveServices = getIt<HiveServices>();
  List<Product> products = [], fav = [], cart = [];

  Future<void> fetchAllProducts() async {
    _hiveServices.init();
    // _hiveServices.clearBoxes();
    products = _hiveServices.products;

    if (products.isEmpty) {
      await _hiveServices.addProducts(products);
    } else {
      fav = _hiveServices.favorites;
      cart = _hiveServices.cartProducts;
    }
    try {
      ApiService client = getIt<ApiService>();
      BaseResponse response = await client.getAllProducts();

      products = response.products ?? [];
      print('Received products: $products');
    } catch (e) {
      print('Error fetching products: $e');
      rethrow;
    }
  }

  void removeCart() {
    _hiveServices.clearCart();
  }

  Future<void> toggleFav(Product product) async {
    _hiveServices.toggleFavorite(product);
  }

  Future<void> toggleCart(Product product, int direction) async {
    _hiveServices.toggleCartProduct(product, direction);
  }

  int getQuantity(int productId) {
    return _hiveServices.getQuantity(productId) ?? 0;
  }

  Future<List<List<Product>>> getLists() async {
    products.isEmpty ? fetchAllProducts() : null;
    return [products, fav, cart];
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
}
