import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/theming/styles.dart';
import 'package:my_store/features/Cart/widgets/cart_list_builder.dart';
import 'package:my_store/features/Cart/widgets/proceed_button.dart';
import 'package:my_store/features/main%20screen/presentation/widgets/main_screen_cubit.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final list = context.watch<MainScreenCubit>().provider.cartItems;
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
  }
}
