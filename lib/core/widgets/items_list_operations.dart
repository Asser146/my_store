import 'package:my_store/core/di/dependency_injection.dart';
import 'package:my_store/features/main_screen/data/item.dart';
import 'package:my_store/features/main_screen/domain/item_repository.dart';

mixin ItemsListOperations {
  List<List<Item>> lists = [];
  List<Item> items = [], favourites = [], cartItems = [];
  final ItemRepository repo = getIt<ItemRepository>();
  void init() async {
    lists = await repo.getLists();
    items = lists[0];
    favourites = lists[1];
    cartItems = lists[2];
  }

  Future<void> toggleFavourite(Item item) async {
    if (favourites.contains(item)) {
      favourites.remove(item);
    } else {
      favourites.add(item);
    }
    await repo.toggleFav(item);
  }

  bool isFav(Item item) {
    return favourites.contains(item);
  }

  Future<void> toggleCart(Item item) async {
    if (cartItems.contains(item)) {
      cartItems.remove(item);
    } else {
      cartItems.add(item);
    }
    await repo.toggleCart(item);
  }

  bool isCart(Item item) {
    return cartItems.contains(item);
  }
}
