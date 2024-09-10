import 'package:my_store/features/main_screen/data/product.dart';

class ItemsListParams {
  final List<Product> list;
  final Future<void> Function(Product) toggleFav;
  final bool Function(Product) isFav;
  final bool Function(Product) isCart;
  final Future<void> Function(Product, int) toggleCart;
  int? index;
  Product? item;

  ItemsListParams(
      {required this.list,
      required this.toggleFav,
      required this.isFav,
      required this.isCart,
      required this.toggleCart,
      this.index,
      this.item});
}
