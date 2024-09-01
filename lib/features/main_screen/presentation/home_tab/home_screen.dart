import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/theming/colors.dart';
import 'package:my_store/core/theming/styles.dart';
import 'package:my_store/features/main_screen/presentation/home_tab/home_cubit/home_cubit.dart';
import 'package:my_store/features/main_screen/presentation/home_tab/widgets/tabs_list.dart';
import 'package:my_store/core/widgets/items_cards_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<HomeCubit>().reInitialize();

    return Container(
      color: ColorsManager.primaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Recent products",
                    style: TextStyles.font24BlackBold
                        .copyWith(color: Colors.white)),
                DropdownButton(
                  icon: Icon(Icons.filter_list, size: 24.sp),
                  underline: const SizedBox(),
                  items: const [
                    DropdownMenuItem(
                      value: 'price',
                      child: Text('Price'),
                    ),
                    DropdownMenuItem(
                      value: 'limit5',
                      child: Text('Limit 5'),
                    ),
                  ],
                  onChanged: (value) async {
                    if (value == 'limit5') {}
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 8.h),
          TabsList(categories: context.read<HomeCubit>().categories),
          SizedBox(height: 8.h),
          ItemsCardsList(params: context.watch<HomeCubit>().getParams())
        ],
      ),
    );
  }
}
