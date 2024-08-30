import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/theming/styles.dart';
import 'package:my_store/features/main_screen/data/item.dart';

class MidBody extends StatelessWidget {
  const MidBody({
    super.key,
    required this.item,
  });

  final Item item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: Column(
        children: [
          Text(
            item.title!,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${item.price!.toStringAsFixed(2)} \$",
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const Spacer(),
              const Icon(Icons.star, color: Colors.orangeAccent),
              SizedBox(width: 5.w),
              Text(
                "${item.rating!.rate}",
                style: TextStyles.font15BlackMedium.copyWith(fontSize: 17.sp),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
