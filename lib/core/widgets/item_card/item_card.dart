import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/theming/colors.dart';
import 'package:my_store/core/widgets/item_card/mid_body.dart';
import 'package:my_store/core/widgets/item_card/top_body.dart';
import 'package:my_store/features/main_screen/data/item.dart';

class ItemCard extends StatelessWidget {
  final Item item;
  final bool Function(Item) isFav;
  final Future<void> Function(Item) toggleFav;

  const ItemCard({
    super.key,
    required this.item,
    required this.isFav,
    required this.toggleFav,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 0.4.sw,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.5.w,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(15.r),
        ),
        color: ColorsManager.cardColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TopBody(item: item, isFav: isFav, toggleFav: toggleFav),
          const Spacer(),
          MidBody(item: item),
        ],
      ),
    );
  }
}
