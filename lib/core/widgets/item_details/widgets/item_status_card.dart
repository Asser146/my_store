import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/theming/colors.dart';
import 'package:my_store/core/theming/styles.dart';
import 'package:my_store/core/widgets/item_details/item_details_cubit/item_details_cubit.dart';
import 'package:my_store/features/main_screen/data/item.dart';

class ItemStatusCard extends StatelessWidget {
  const ItemStatusCard({
    super.key,
    required this.item,
  });

  final Item item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      child: GestureDetector(
        onTap: () async =>
            await context.read<ItemDetailsCubit>().toggleDetailsCart(item, 1),
        child: Container(
          height: 50.h,
          decoration: BoxDecoration(
            color: ColorsManager.secondaryColor,
            borderRadius: BorderRadius.all(
              Radius.circular(20.r),
            ),
          ),
          width: double.infinity,
          child: context.watch<ItemDetailsCubit>().isDetailsCart(item)
              ? Center(
                  child: Text("In Cart", style: TextStyles.buttonTextWhite),
                )
              : Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("\$${item.price!}",
                          style: TextStyles.buttonTextWhite),
                      Text("Add to Cart", style: TextStyles.buttonTextWhite),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
