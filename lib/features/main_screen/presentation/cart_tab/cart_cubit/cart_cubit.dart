import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/features/main_screen/data/item.dart';
import 'package:my_store/core/widgets/item_card_list/items_list_operations.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> with ItemsListOperations {
  CartCubit() : super(CartStateInitial()) {
    cartInit();
  }
  Future<void> cartInit() async {
    emit(CartStateInitial());
    init();
    emit(CartStateItems(items: items, cart: cartItems));
  }

  List<Item> get list {
    cartInit();
    return cartItems;
  }

  double get sum {
    double total = 0.0;
    for (var item in cartItems) {
      total += item.price! * getQuantity(item.id!);
    }
    return total;
  }

  void toggleQuantity(Item item, int direction) {
    toggleCart(item, direction);
  }

  int getCartQuantity(int itemId) {
    return getQuantity(itemId);
  }

  void removeAll() {
    cartItems.clear();
    removeAllCart();
  }
}
