import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/theming/styles.dart';
import 'package:my_store/features/Home/data/item.dart';
import 'package:my_store/features/Home/presentation/home_cubit/home_cubit.dart';
import 'package:my_store/features/Home/presentation/widgets/item_card_provider.dart';
import 'package:my_store/features/Home/presentation/widgets/items_cards_list.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  // final List<Item> itemsList;

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                underline:
                    SizedBox(), // Removes the underline from the dropdown
                items: const [
                  DropdownMenuItem(
                    value: 'price',
                    child: Text('Price'),
                  ),
                  DropdownMenuItem(
                    value: 'limit5',
                    child: Text('limit5'),
                  ),
                ],
                onChanged: (value) async {
                  if (value == 'limit5') {
                    // await context.read<ItemsListCubit>().limit5Products();
                  }
                },
              ),
            ],
          ),
        ),
        SizedBox(height: 12.h),
        ItemsCardsList()
      ],
    );
  }
}
