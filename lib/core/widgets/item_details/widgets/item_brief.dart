import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/theming/colors.dart';
import 'package:my_store/features/main_screen/data/item.dart';

class ItemBrief extends StatelessWidget {
  const ItemBrief({
    super.key,
    required this.item,
  });

  final Item item;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 5.h),
            Text(
              item.description ?? 'No Description Available',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: 10.h),
            Row(
              children: [
                for (int i = 0; i < 5; i++)
                  Icon(
                    item.rating!.rate! >= i + 1
                        ? Icons.star
                        : Icons.star_border,
                    color: item.rating!.rate! >= i + 1
                        ? ColorsManager.starColor
                        : Colors.grey[600],
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
