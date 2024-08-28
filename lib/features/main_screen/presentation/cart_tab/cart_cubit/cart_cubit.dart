import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/core/di/dependency_injection.dart';
import 'package:my_store/features/main_screen/data/item.dart';
import 'package:my_store/features/main_screen/domain/item_repository.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final List<String> categories = ["ALL"];
  final ItemRepository repo = getIt<ItemRepository>();
  List<List<Item>> lists = [];
  List<Item> items = [], cartItems = [];

  CartCubit() : super(CartStateInitial());
  Future<void> init() async {
    emit(CartStateInitial());
    lists = await repo.getLists();
    items = lists[0];
    cartItems = lists[2];
    emit(CartStateItems(items: items, cart: cartItems));
  }

  Future<void> toggleCart(Item item) async {
    emit(CartStateLoading());
    if (cartItems.contains(item)) {
      cartItems.remove(item);
    } else {
      cartItems.add(item);
    }
    await repo.toggleCart(item);
    emit(CartStateItems(items: items, cart: cartItems));
  }

  bool isCart(Item item) {
    return cartItems.contains(item);
  }
}
