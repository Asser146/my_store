import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/theming/colors.dart';
import 'package:my_store/core/theming/styles.dart';
import 'package:my_store/features/main_screen/data/item.dart';

class HorizontaItemCar extends StatelessWidget {
  const HorizontaItemCar({
    super.key,
    required this.item,
  });

  final Item item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Container(
        decoration: BoxDecoration(
          color: ColorsManager.cardColor,
          borderRadius: BorderRadius.all(Radius.circular(18.r)),
          border: Border.all(
            color: Colors.black,
            width: 2.r,
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.h),
        width: double.infinity,
        height: 100.h,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              item.image!,
              width: 100.r,
              height: 100.r,
              fit: BoxFit.cover,
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Item Title",
                  style: TextStyles.font14darkrBold,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 10.h),
                Text(
                  "${item.price!.toStringAsFixed(2)} \$",
                  style:
                      TextStyles.font12greenRegular.copyWith(fontSize: 20.sp),
                ),
              ],
            ),
            const Spacer(),
            Center(
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.remove),
                  ),
                  const Text("1"),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.add),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
