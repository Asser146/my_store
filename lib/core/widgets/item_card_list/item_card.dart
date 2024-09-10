import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/widgets/item_card_list/bottom_body.dart';
import 'package:my_store/core/widgets/item_card_list/top_body.dart';

import 'package:my_store/features/main_screen/data/product.dart';

class ItemCard extends StatelessWidget {
  final Product item;
  final bool Function(Product) isFav;
  final Future<void> Function(Product) toggleFav;

  const ItemCard({
    super.key,
    required this.item,
    required this.isFav,
    required this.toggleFav,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 281.r,
      width: 161.r,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(15.r),
        ),
        color: Theme.of(context).cardColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TopBody(item: item, isFav: isFav, toggleFav: toggleFav),
          const Spacer(),
          BottomBody(item: item),
        ],
      ),
    );
  }
}
