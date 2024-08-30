import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/theming/colors.dart';
import 'package:my_store/features/main_screen/data/item.dart';

class BottomBody extends StatelessWidget {
  const BottomBody({
    super.key,
    required this.toggleCart,
    required this.item,
    required this.isCart,
  });

  final Future<void> Function(Item p1) toggleCart;
  final Item item;
  final bool Function(Item p1) isCart;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await toggleCart(item);
      },
      child: Container(
        height: 40.h,
        decoration: BoxDecoration(
          color: isCart(item)
              ? ColorsManager.inCartColor
              : ColorsManager.buttonColor,
          borderRadius: BorderRadius.all(
            Radius.circular(15.r),
          ),
        ),
        width: double.infinity,
        child: Center(
          child: Text(
            "Add to Cart",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
