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
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
        child: Container(
          width: double.infinity,
          height: 40.h,
          decoration: BoxDecoration(
            color: ColorsManager.buttonColor,
            border: Border.all(
              color: ColorsManager.selectedTabColor,
              width: 1.r,
            ),
          ),
          child: Center(
              child: Text(
            "Proceed: $sum \$",
            style: TextStyles.font24BlackBold,
          )),
        ),
      ),
    );
  }
}
