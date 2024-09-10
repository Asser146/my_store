import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/theming/styles.dart';
import 'package:my_store/core/widgets/item_details/item_details_cubit/item_details_cubit.dart';
import 'package:my_store/core/widgets/item_details/widgets/quantity_button.dart';
import 'package:my_store/features/main_screen/data/product.dart';

class QuantityCard extends StatelessWidget {
  final Product item;

  const QuantityCard({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    final quantity =
        context.watch<ItemDetailsCubit>().getDetailsQuantity(item.id!);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      child: Container(
        height: 50.h,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(20.r),
        ),
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            children: [
              Text(
                'Quantity',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const Spacer(),
              QuantityButton(item: item, direction: -1),
              SizedBox(width: 20.w),
              Text(
                quantity.toString(),
                style: TextStyles.buttonTextWhite,
              ),
              SizedBox(width: 20.w),
              QuantityButton(item: item, direction: 1),
            ],
          ),
        ),
      ),
    );
  }
}
