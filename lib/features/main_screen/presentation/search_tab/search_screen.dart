import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/theming/styles.dart';
import 'package:my_store/core/widgets/items_cards_list.dart';
import 'package:my_store/features/main_screen/presentation/search_tab/cubit/search_cubit.dart';
import 'package:my_store/features/main_screen/presentation/search_tab/widgets/search_text_field.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<SearchCubit>().searchInit();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10.h),
        const SearchTextField(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Search for products", style: TextStyles.font24BlackBold),
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
        SizedBox(height: 12.h),
        ItemsCardsList(
            list: context.read<SearchCubit>().filteredItems.isEmpty
                ? context.read<SearchCubit>().items
                : context.read<SearchCubit>().filteredItems,
            toggleFav: context.watch<SearchCubit>().toggleFavourite,
            isFav: context.read<SearchCubit>().isFav,
            isCart: context.read<SearchCubit>().isCart,
            toggleCart: context.watch<SearchCubit>().toggleCart)
      ],
    );
  }
}
