import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/theming/colors.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 40.h,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(22.sp),
          bottomRight: Radius.circular(22.sp),
        ),
      ),
      backgroundColor: ColorsManager.buttonColor,
      centerTitle: true,
      title: Text("A-Store"),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(45.h);
}
