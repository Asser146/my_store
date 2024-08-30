import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/theming/styles.dart';
import 'package:my_store/features/main_screen/presentation/cart_tab/cart_cubit/cart_cubit.dart';
import 'package:my_store/features/main_screen/presentation/cart_tab/widgets/cart_list_builder.dart';
import 'package:my_store/features/main_screen/presentation/cart_tab/widgets/proceed_button.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<CartCubit>().cartInit();

    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        final list = context.watch<CartCubit>().cartItems;
        final sum = list.fold<double>(
            0.0, (previousValue, item) => previousValue + (item.price ?? 0.0));

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "My Cart",
                style: TextStyles.font24BlackBold,
              ),
            ),
            SizedBox(height: 12.h),
            CartListBuilder(list: list),
            ProcessdButton(sum: sum)
          ],
        );
      },
    );
  }
}
