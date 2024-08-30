import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/theming/styles.dart';
import 'package:my_store/features/main_screen/presentation/home_tab/home_cubit/home_cubit.dart';
import 'package:my_store/features/main_screen/presentation/home_tab/widgets/tabs_list.dart';
import 'package:my_store/core/widgets/items_cards_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<HomeCubit>().reInitialize();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Recent products", style: TextStyles.font24BlackBold),
              DropdownButton(
                icon: Icon(Icons.filter_list, size: 24.sp),
                underline: const SizedBox(),
                items: const [
                  DropdownMenuItem(
                    value: 'limit5',
                    child: Text('Limit 5'),
                  ),
                ],
                onChanged: (value) async {
                  if (value == 'limit5') {
                    context.read<HomeCubit>().limit5();
                  }
                },
              ),
            ],
          ),
        ),
        SizedBox(height: 8.h),
        TabsList(categories: context.read<HomeCubit>().categories),
        SizedBox(height: 8.h),
        ItemsCardsList(
            list: context.read<HomeCubit>().getItemsToShow(),
            toggleFav: context.watch<HomeCubit>().toggleFavourite,
            isFav: context.read<HomeCubit>().isFav,
            isCart: context.read<HomeCubit>().isCart,
            toggleCart: context.watch<HomeCubit>().toggleCart)
      ],
    );
  }
}
