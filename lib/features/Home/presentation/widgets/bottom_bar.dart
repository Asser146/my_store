import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/theming/colors.dart';
import 'package:my_store/core/theming/styles.dart';
import 'package:my_store/features/main%20screen/bottom_bar_cubit/bottom_bar_cubit.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomBarCubit, BottomBarState>(
      builder: (context, state) {
        int currentIndex = 0;
        if (state is BottomBarHomeSelected) {
          currentIndex = 0;
        } else if (state is BottomBarSearchSelected) {
          currentIndex = 1;
        } else if (state is BottomBarCartSelected) {
          currentIndex = 2;
        }

        return BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            context.read<BottomBarCubit>().updateIndex(index);
          },
          selectedItemColor: ColorsManager.buttonColor,
          unselectedItemColor: Colors.grey,
          selectedLabelStyle: TextStyles.font12greenRegular,
          unselectedLabelStyle: const TextStyle(color: Colors.grey),
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
              icon: Icon(Icons.shopping_cart, size: 30.r),
              label: 'Cart',
            ),
          ],
        );
      },
    );
  }
}
