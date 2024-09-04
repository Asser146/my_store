import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/theming/colors.dart';
import 'package:my_store/core/theming/styles.dart';
import 'package:my_store/core/widgets/item_details/item_details_cubit/item_details_cubit.dart';
import 'package:my_store/features/main_screen/data/item.dart';

class ItemDescription extends StatelessWidget {
  const ItemDescription({
    super.key,
    required this.item,
  });

  final Item item;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: ColorsManager.darkPrimaryColor,
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
                        context.read<ItemDetailsCubit>().item.rating!.rate! >=
                                i + 1
                            ? Icons.star
                            : Icons.star_border,
                        color: context
                                    .read<ItemDetailsCubit>()
                                    .item
                                    .rating!
                                    .rate! >=
                                i + 1
                            ? ColorsManager.starColor
                            : Colors.grey[600],
                      ),
                    const Spacer(),
                    IconButton(
                      icon: Icon(
                        context.watch<ItemDetailsCubit>().isFav(item)
                            ? Icons.favorite
                            : Icons.favorite_outline,
                        color: context.watch<ItemDetailsCubit>().isFav(item)
                            ? ColorsManager.removeColor
                            : null,
                        size: 25.sp,
                      ),
                      onPressed: () async {
                        await context
                            .read<ItemDetailsCubit>()
                            .toggleDetailsFavourite(item);
                      },
                    )
                  ],
                ),
                SizedBox(height: 15.h),
                Text(
                  context.watch<ItemDetailsCubit>().item.description!,
                  style: TextStyles.hintTextLightMode
                      .copyWith(color: Colors.white)
                      .copyWith(fontSize: 20.sp),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
