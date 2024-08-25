import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/theming/colors.dart';
import 'package:my_store/core/theming/styles.dart';
import 'package:my_store/core/widgets/my_app_bar.dart';
import 'package:my_store/features/main%20screen/data/item.dart';

class ItemDetails extends StatelessWidget {
  final Item item;
  const ItemDetails({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: ColorsManager.cardColor,
            ),
            height: 200.h,
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h),
              child: Image.network(item.image!),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: ColorsManager.saerchTextFieldHintColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.r),
                  topRight: Radius.circular(30.r),
                ),
              ),
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.title!,
                        style: TextStyles.font14darkrBold
                            .copyWith(color: Colors.white)
                            .copyWith(fontSize: 25.sp),
                      ),
                      SizedBox(height: 20.h),
                      Row(
                        children: [
                          for (int i = 0; i < 5; i++)
                            Icon(
                              item.rating!.rate! >= i + 1
                                  ? Icons.star
                                  : Icons.star_border,
                              color: item.rating!.rate! >= i + 1
                                  ? ColorsManager.selectedTabColor
                                  : Colors.grey[600],
                            ),
                        ],
                      ),
                      SizedBox(height: 15.h),
                      Text(
                        item.description!,
                        style: TextStyles.font15BlackMedium
                            .copyWith(color: Colors.white)
                            .copyWith(fontSize: 20.sp),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
