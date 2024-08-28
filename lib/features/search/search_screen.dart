import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/theming/styles.dart';
import 'package:my_store/features/main%20screen/presentation/widgets/items_cards_list.dart';
import 'package:my_store/features/search/cubit/search_cubit.dart';
import 'package:my_store/features/search/widgets/search_text_field.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final searchCubit = context.watch<SearchCubit>();

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
        BlocBuilder<SearchCubit, SearchState>(
          builder: (context, state) {
            searchCubit.init();
            if (state is SearchLoaded) {
              return ItemsCardsList(
                  list: state.items,
                  toggleFav: searchCubit.toggleFavorite,
                  isFav: searchCubit.isFavourite);
            } else {
              return ItemsCardsList(
                  list: searchCubit.searchItem,
                  toggleFav: searchCubit.toggleFavorite,
                  isFav: searchCubit.isFavourite);
            }
          },
        ),
      ],
    );
  }
}
