import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/features/main%20screen/data/item.dart';
import 'package:my_store/features/main%20screen/presentation/widgets/item_card.dart';

class ItemsCardsList extends StatelessWidget {
  const ItemsCardsList({
    super.key,
    required this.list,
    required this.toggleFav,
    required this.isFav,
  });

  final List<Item> list;
  final bool Function(Item) isFav;
  final Future<void> Function(Item) toggleFav;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.w,
            mainAxisSpacing: 5.h,
            childAspectRatio: 0.7,
          ),
          itemCount: list.length,
          itemBuilder: (BuildContext context, int index) {
            return ItemCard(
              item: list[index],
              isFav: isFav,
              toggleFav: toggleFav,
            );
          },
        ),
      ),
    );
  }
}
