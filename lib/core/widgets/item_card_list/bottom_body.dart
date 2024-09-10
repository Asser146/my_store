import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/features/main_screen/data/product.dart';

class BottomBody extends StatelessWidget {
  const BottomBody({
    super.key,
    required this.item,
  });

  final Product item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: Column(
        children: [
          Text(
            item.title!,
            style: Theme.of(context).textTheme.labelMedium,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${item.price!.toStringAsFixed(2)} \$",
                style: Theme.of(context).textTheme.labelSmall,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const Spacer(),
              const Icon(Icons.star, color: Colors.orangeAccent),
              SizedBox(width: 5.w),
              Text(
                "${item.rating!}",
                style: Theme.of(context).textTheme.labelSmall,
              )
            ],
          ),
        ],
      ),
    );
  }
}
