import 'package:hive/hive.dart';
import 'package:my_store/features/main_screen/data/product.dart';

class HiveServices {
  static final HiveServices _instance = HiveServices._internal();
  late Box<Product> _favoritesBox;
  late Box<Product> _cartBox;
  late Box<Product> _productsBox;
  late Box<int> _quantityBox;

  factory HiveServices() {
    return _instance;
  }

  HiveServices._internal();

  Future<void> init() async {
    _productsBox = await Hive.openBox<Product>('productsBox');
    _favoritesBox = await Hive.openBox<Product>('productsfavoritesBox');
    _cartBox = await Hive.openBox<Product>('productscartBox');
    _quantityBox = await Hive.openBox<int>('productsquantityBox');
    // clearBoxes();
  }

  void clearCart() {
    _quantityBox.clear();
    _cartBox.clear();
  }

  List<Product> get products {
    return _productsBox.values.toList();
  }

  Future<void> addProducts(List<Product> productsList) async {
    for (Product product in productsList) {
      await _productsBox.put(product.id, product);
    }
  }

  // Favorite Products Methods
  bool isFavorite(Product product) {
    return _favoritesBox.containsKey(product.id);
  }

  Future<void> toggleFavorite(Product product) async {
    if (isFavorite(product)) {
      await _favoritesBox.delete(product.id);
    } else {
      await _favoritesBox.put(product.id, product.copyWith());
    }
  }

  List<Product> get favorites {
    return _favoritesBox.values.toList();
  }

  // Cart Products Methods
  bool isInCart(Product product) {
    return _cartBox.containsKey(product.id);
  }

  Future<void> toggleCartProduct(Product product, int direction) async {
    if (direction > 0) {
      if (isInCart(product)) {
        await _quantityBox.put(product.id!, _quantityBox.get(product.id)! + 1);
      } else {
        await _cartBox.put(product.id, product.copyWith());
        await _quantityBox.put(product.id!, 1);
      }
    } else {
      if (_quantityBox.containsKey(product.id)) {
        await _quantityBox.put(product.id!, _quantityBox.get(product.id)! - 1);
      }
      if (_quantityBox.get(product.id) == 0) {
        await _cartBox.delete(product.id);
        await _quantityBox.delete(product.id);
      }
    }
  }

  int getQuantity(int productId) {
    return _quantityBox.get(productId, defaultValue: 0)!;
  }

  List<Product> get cartProducts {
    return _cartBox.values.toList();
  }

  Future<void> clearBoxes() async {
    await _favoritesBox.clear();
    await _cartBox.clear();
    await _productsBox.clear();
    await _quantityBox.clear();
  }
}
