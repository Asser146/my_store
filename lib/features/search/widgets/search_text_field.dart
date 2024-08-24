import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/theming/colors.dart';
import 'package:my_store/core/theming/styles.dart';
import 'package:my_store/features/Home/data/item.dart';
import 'package:my_store/features/search/cubit/search_cubit.dart';
import 'package:provider/provider.dart';

class SearchTextField extends StatelessWidget {
  final List<Item> list;

  const SearchTextField({super.key, required this.list});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Container(
        width: double.infinity,
        height: 45.h, // Adjust height if needed
        decoration: BoxDecoration(
          color: ColorsManager
              .bottombarIconsColor, // Background color of the container
          borderRadius: BorderRadius.all(
            Radius.circular(20.r),
          ), // Circular border radius
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: TextField(
            cursorColor: ColorsManager.buttonColor,
            onChanged: (query) {
              context.read<SearchCubit>().search(list, query);
            },
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Type to Search ...',
              hintStyle: TextStyles.font15BlackMedium.copyWith(fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}
