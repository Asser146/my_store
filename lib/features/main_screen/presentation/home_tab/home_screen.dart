import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/features/main_screen/presentation/home_tab/home_cubit/home_cubit.dart';
import 'package:my_store/features/main_screen/presentation/home_tab/widgets/tabs_list.dart';
import 'package:my_store/core/widgets/item_card_list/items_cards_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 5.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Text("Categories",
                style: Theme.of(context).textTheme.titleLarge),
          ),
          SizedBox(height: 8.h),
          // TabsList(categories: context.read<HomeCubit>().categories),
          SizedBox(height: 8.h),
          // ItemsCardsList(params: context.watch<HomeCubit>().params)
        ],
      ),
    );
  }
}
