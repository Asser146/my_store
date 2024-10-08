import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/routing/routes.dart';
import 'package:my_store/core/theming/colors.dart';
import 'package:my_store/core/theming/styles.dart';

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
      backgroundColor: ColorsManager.secondaryColor,
      centerTitle: true,
      title: Text("A-Store",
          style: TextStyles.buttonTextWhite.copyWith(fontSize: 20.sp)),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 15.w),
          child: DropdownButton(
            icon: const Icon(Icons.settings),
            underline: const SizedBox(),
            items: const [
              DropdownMenuItem(
                value: 'logout',
                child: Text('Logout'),
              ),
            ],
            onChanged: (value) async {
              if (value == 'logout') {
                Navigator.pushNamed(context, Routes.login, arguments: 1);
              }
            },
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(45.h);
}
