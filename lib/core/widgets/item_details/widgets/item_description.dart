import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/theming/colors.dart';
import 'package:my_store/core/theming/styles.dart';
import 'package:my_store/core/widgets/item_details/widgets/item_brief.dart';
import 'package:my_store/core/widgets/item_details/widgets/item_status_card.dart';
import 'package:my_store/core/widgets/item_details/widgets/quantity_card.dart';
import 'package:my_store/features/main_screen/data/item.dart';
import 'package:my_store/core/widgets/item_details/item_details_cubit/item_details_cubit.dart';

class ItemDescription extends StatelessWidget {
  const ItemDescription({
    super.key,
    required this.item,
  });

  final Item item;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.r),
          topRight: Radius.circular(30.r),
        ),
      ),
      width: double.infinity,
      child: Padding(
        padding:
            EdgeInsets.only(left: 10.w, bottom: 10.h, top: 15.h, right: 10.w),
        child: Column(
          children: [
            Text(
              item.title ?? 'No Title',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Row(
              children: [
                Text(
                  "\$${item.price?.toStringAsFixed(2) ?? 'N/A'}",
                  style: TextStyles.buttonTextWhite
                      .copyWith(color: ColorsManager.secondaryColor),
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
                ),
              ],
            ),
            QuantityCard(item: item),
            ItemBrief(item: item),
            ItemStatusCard(item: item),
          ],
        ),
      ),
    );
  }
}
