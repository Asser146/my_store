import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/theming/colors.dart';
import 'package:my_store/core/theming/styles.dart';
import 'package:my_store/features/main_screen/presentation/cart_tab/cart_cubit/cart_cubit.dart';
import 'package:my_store/features/main_screen/presentation/cart_tab/widgets/cart_list_builder.dart';
import 'package:my_store/features/main_screen/presentation/cart_tab/widgets/proceed_button.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorsManager.primaryColor,
      child: context.watch<CartCubit>().list.isEmpty
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/parcel 1.png',
                  width: 200.w,
                  height: 200.h,
                ),
                Text("Your Cart is Empty :(",
                    style: TextStyles.font24limeExtraBold
                        .copyWith(color: Colors.white))
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    "Cart",
                    style: TextStyles.font24BlackBold
                        .copyWith(color: Colors.white),
                  ),
                ),
                SizedBox(height: 12.h),
                CartListBuilder(list: context.watch<CartCubit>().list),
                ProcessdButton(sum: context.watch<CartCubit>().sum)
              ],
            ),
    );
  }
}
