import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/theming/colors.dart';
import 'package:my_store/core/theming/styles.dart';

class ProcessdButton extends StatelessWidget {
  const ProcessdButton({
    super.key,
    required this.sum,
  });

  final double sum;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: Container(
          width: double.infinity,
          height: 40.h,
          decoration: BoxDecoration(
              color: ColorsManager.secondaryColor,
              borderRadius: BorderRadius.all(Radius.circular(20.r))),
          child: Center(
              child: Text(
            "Checkout",
            style: TextStyles.buttonTextWhite,
          )),
        ),
      ),
    );
  }
}
