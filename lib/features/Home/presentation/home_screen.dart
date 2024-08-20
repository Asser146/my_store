import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/theming/styles.dart';
import 'package:my_store/features/Home/data/item.dart';
import 'package:my_store/features/Home/presentation/widgets/items_cards_list.dart';

class HomeScreen extends StatelessWidget {
  final List<Item> itemsList;

  const HomeScreen({super.key, required this.itemsList});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
            child: Text("Recent products", style: TextStyles.font24BlackBold)),
        SizedBox(height: 12.h),
        ItemsCardsList(itemsList: itemsList),
      ],
    );
  }
}
