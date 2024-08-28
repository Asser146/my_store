import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/features/main_screen/data/item.dart';
import 'package:my_store/core/widgets/items_list_operations.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> with ItemsListOperations {
  CartCubit() : super(CartStateInitial());
  Future<void> cartInit() async {
    emit(CartStateInitial());
    init();
    emit(CartStateItems(items: items, cart: cartItems));
  }

  Future<void> cartToggleCart(Item item) async {
    emit(CartStateLoading());
    toggleCart(item);
    emit(CartStateItems(items: items, cart: cartItems));
  }

  bool isCart(Item item) {
    return cartItems.contains(item);
  }
}
