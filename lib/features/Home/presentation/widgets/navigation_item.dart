import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/theming/colors.dart';
import 'package:my_store/features/main%20screen/bottom_bar_cubit/bottom_bar_cubit.dart';

class NavigationItem extends StatelessWidget {
  final IconData icon; // Use IconData for material icons
  final int index;
  const NavigationItem({
    super.key,
    required this.icon,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomBarCubit, BottomBarState>(
      builder: (context, state) {
        return IconButton(
          icon: Icon(icon),
          color: ColorsManager.buttonColor,
          iconSize: 35.r,
          onPressed: () {
            context.read<BottomBarCubit>().updateIndex(index);
          },
        );
      },
    );
  }
}
