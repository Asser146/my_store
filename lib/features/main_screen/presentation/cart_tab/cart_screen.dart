import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/features/main_screen/presentation/cart_tab/cart_cubit/cart_cubit.dart';
import 'package:my_store/features/main_screen/presentation/cart_tab/widgets/cart_details.dart';
import 'package:my_store/features/main_screen/presentation/cart_tab/widgets/cart_list_builder.dart';
import 'package:my_store/features/main_screen/presentation/cart_tab/widgets/cart_place_holder.dart';
import 'package:my_store/features/main_screen/presentation/cart_tab/widgets/proceed_button.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: context.watch<CartCubit>().list.isEmpty
          ? const CartPlaceHolder()
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Spacer(),
                      TextButton(
                          onPressed: () =>
                              context.read<CartCubit>().removeAll(),
                          child: Text("Remove All",
                              style: Theme.of(context).textTheme.titleMedium))
                    ],
                  ),
                ),
                SizedBox(height: 8.h),
                CartListBuilder(list: context.watch<CartCubit>().list),
                const CartDetails(),
                ProcessdButton(sum: context.watch<CartCubit>().sum)
              ],
            ),
    );
  }
}
