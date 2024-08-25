import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/theming/colors.dart';
import 'package:my_store/features/Home/presentation/home_cubit/home_cubit.dart';
import 'package:my_store/features/main%20screen/presentation/widgets/item_card_provider.dart';

class TabsList extends StatelessWidget {
  const TabsList({
    super.key,
    required this.provider,
  });

  final ItemCardProvider provider;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: provider.categories.length, // Number of categories
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              context.read<HomeCubit>().changeTab(index);
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 8.w),
              decoration: BoxDecoration(
                color: index == context.watch<HomeCubit>().currentTabIndex
                    ? ColorsManager.selectedTabColor
                    : ColorsManager.saerchTextFieldHintColor,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: Text(
                  provider.categories[index],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
