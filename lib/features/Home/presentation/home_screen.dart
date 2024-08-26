import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/theming/styles.dart';
import 'package:my_store/features/Home/presentation/home_cubit/home_cubit.dart';
import 'package:my_store/features/main%20screen/presentation/widgets/item_card_provider.dart';
import 'package:my_store/features/main%20screen/presentation/widgets/items_cards_list.dart';
import 'package:my_store/features/Home/presentation/widgets/tabs_list.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<HomeCubit>().provider;
    final homeCubit = context.read<HomeCubit>();

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
        TabsList(provider: provider),
        SizedBox(height: 8.h),
        BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            final currentIndex = homeCubit.currentTabIndex;
            final itemsToShow = currentIndex == 0
                ? provider.items
                : provider.items
                    .where((item) =>
                        item.category == provider.categories[currentIndex])
                    .toList();

            return ChangeNotifierProvider(
              create: (context) => ItemCardProvider(),
              child: ItemsCardsList(list: itemsToShow),
            );
          },
        ),
      ],
    );
  }
}
