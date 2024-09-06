import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/features/main_screen/data/item.dart';
import 'package:my_store/features/main_screen/presentation/cart_tab/cart_cubit/cart_cubit.dart';
import 'package:my_store/features/main_screen/presentation/cart_tab/widgets/cart_quantity_controller.dart';

class HorizontaItemCar extends StatelessWidget {
  const HorizontaItemCar({
    super.key,
    required this.item,
  });

  final Item item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.all(Radius.circular(18.r)),
        ),
        padding: EdgeInsets.only(right: 10.w, top: 5.h, bottom: 5.h, left: 3.w),
        width: double.infinity,
        height: 100.h,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              item.image!,
              width: 80.r,
              height: 80.r,
              fit: BoxFit.contain,
            ),
            SizedBox(width: 8.w), // Add some space between image and text
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    item.title!,
                    style: Theme.of(context).textTheme.labelMedium,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    "Quantity:  ${context.watch<CartCubit>().getCartQuantity(item.id!)}",
                    style: Theme.of(context).textTheme.labelMedium,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "\$ ${item.price! * context.watch<CartCubit>().getCartQuantity(item.id!)}",
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                CartQuantityController(item: item),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
