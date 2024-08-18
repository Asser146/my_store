import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/theming/colors.dart';
import 'package:my_store/features/Home/presentation/widgets/navigation_item.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 4.h),
        decoration: const BoxDecoration(
          color: ColorsManager.cardColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            NavigationItem(
              icon: Icons.home_outlined,
              index: 1,
            ),
            NavigationItem(
              icon: Icons.search,
              index: 2,
            ),
            NavigationItem(
              icon: Icons.favorite_outline,
              index: 3,
            ),
          ],
        ),
      ),
    );
  }
}
