import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/theming/colors.dart';
import 'package:my_store/core/theming/styles.dart';

class SearchTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 45.h, // Adjust height if needed
      decoration: BoxDecoration(
        color: ColorsManager.cardColor, // Background color of the container
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(20.r),
          bottomLeft: Radius.circular(20.r),
        ), // Circular border radius
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
        ), // Add horizontal padding if needed
        child: TextField(
          cursorColor: ColorsManager.buttonColor,
          decoration: InputDecoration(
            border: InputBorder.none, // Remove the default TextField border
            hintText: 'Search For Products...',
            hintStyle: TextStyles.font15BlackMedium,
          ),
        ),
      ),
    );
  }
}
