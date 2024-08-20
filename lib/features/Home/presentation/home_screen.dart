import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: const Text("Recent Products"),
        ),
        ItemsCardsList(itemsList: itemsList),
      ],
    );
  }
}
