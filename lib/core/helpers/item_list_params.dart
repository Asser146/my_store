import 'package:my_store/features/main_screen/data/item.dart';

class ItemsListParams {
  final List<Item> list;
  final Future<void> Function(Item) toggleFav;
  final bool Function(Item) isFav;
  final bool Function(Item) isCart;
  final Future<void> Function(Item) toggleCart;
  int? index;

  ItemsListParams({
    required this.list,
    required this.toggleFav,
    required this.isFav,
    required this.isCart,
    required this.toggleCart,
    this.index,
  });
}
