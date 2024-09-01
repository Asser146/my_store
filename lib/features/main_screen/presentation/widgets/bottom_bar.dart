import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/theming/colors.dart';
import 'package:my_store/core/theming/styles.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) {
        setState(() {
          currentIndex = index;
        });
      },
      selectedItemColor: ColorsManager
          .secondaryColor, // Set the selected tab icon color to purple
      unselectedItemColor: ColorsManager.bottombarIconsColor,
      selectedLabelStyle: TextStyles.font12greenRegular.copyWith(
          color: ColorsManager
              .secondaryColor), // Set the selected tab label color to purple
      unselectedLabelStyle: TextStyle(color: ColorsManager.bottombarIconsColor),
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home, size: 30.r),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search, size: 30.r),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite, size: 30.r),
          label: 'Favorites',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart, size: 30.r),
          label: 'Cart',
        ),
      ],
    );
  }
}
