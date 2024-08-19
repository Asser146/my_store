import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/theming/colors.dart';
import 'package:my_store/core/theming/font_weight_helper.dart';

class TextStyles {
  static TextStyle font12greenRegular = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.buttonColor,
  );

  static TextStyle font24BlackBold = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeightHelper.medium,
    color: Colors.black,
    // fontFamily: 'Tajawal'
  );
  static TextStyle font16BlackExtraBold = TextStyle(
    fontSize: 28.sp,
    fontWeight: FontWeightHelper.extraBold,
    color: Colors.black,
  );
  static TextStyle font14darkrBold = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.bold,
    color: Colors.black,
  );
  static TextStyle font15BlackMedium = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeightHelper.medium,
    color: Colors.black,
  );

  static TextStyle font12witeRegular = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.regular,
    color: Colors.white,
    // fontFamily: 'Tajawal'
  );
  static TextStyle font26whiteRegular = TextStyle(
    color: Colors.white,
    fontSize: 28.sp,
    fontWeight: FontWeightHelper.regular,
    // fontFamily: 'Tajawal'
  );
  static TextStyle font24limeExtraBold = TextStyle(
    fontSize: 24.sp,
    // color: ColorsManager.limeColor,
    fontWeight: FontWeight.w800,
    // fontFamily: 'Tajawal'
  );
}
