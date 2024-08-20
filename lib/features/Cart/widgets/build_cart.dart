import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/features/Cart/cart_screen.dart';
import 'package:my_store/features/main%20screen/items_list_cubit/items_list_cubit.dart';

class BuildCart extends StatelessWidget {
  const BuildCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ItemsListCubit, ItemsListState>(
      builder: (context, state) {
        if (state is ItemsListStateLoaded) {
          return CartScreen(cartList: context.watch<ItemsListCubit>().cartList);
        } else if (state is ItemsListStateLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ItemsListStateError) {
          return Center(child: Text(state.message));
        } else {
          return const Center(child: Text('Unexpected error occurred'));
        }
      },
    );
  }
}
