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
    return list.fold<double>(
        0.0, (previousValue, item) => previousValue + (item.price ?? 0.0));
  }
}
