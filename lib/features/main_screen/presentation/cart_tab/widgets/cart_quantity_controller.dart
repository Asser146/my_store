import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/theming/colors.dart';
import 'package:my_store/core/theming/styles.dart';
import 'package:my_store/features/main_screen/data/item.dart';
import 'package:my_store/features/main_screen/presentation/cart_tab/cart_cubit/cart_cubit.dart';

class CartQuantityController extends StatelessWidget {
  const CartQuantityController({
    super.key,
    required this.item,
  });

  final Item item;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            context.read<CartCubit>().toggleQuantity(item, -1);
          },
          icon: Icon(
            Icons.remove,
            color: ColorsManager.inCartColor,
            size: 25.sp,
          ),
        ),
        Text(
          context.watch<CartCubit>().getCartQuantity(item.id!).toString(),
          style: TextStyles.font26whiteRegular.copyWith(fontSize: 26.sp),
        ),
        IconButton(
          onPressed: () {
            context.read<CartCubit>().toggleQuantity(item, 1);
          },
          icon: Icon(
            Icons.add,
            color: ColorsManager.buttonColor,
            size: 25.sp,
          ),
        )
      ],
    );
  }
}
