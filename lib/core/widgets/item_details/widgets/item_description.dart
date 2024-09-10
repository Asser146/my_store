import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/theming/colors.dart';
import 'package:my_store/features/main_screen/data/product.dart';
import 'package:my_store/core/widgets/item_details/item_details_cubit/item_details_cubit.dart';

class ItemDescription extends StatelessWidget {
  const ItemDescription({
    super.key,
    required this.item,
  });

  final Product item;

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
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.title!,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(height: 20.h),
              Row(
                children: [
                  for (int i = 0; i < 5; i++)
                    Icon(
                      item.rating! >= i + 1 ? Icons.star : Icons.star_border,
                      color: item.rating! >= i + 1
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
                  ),
                ],
              ),
              SizedBox(height: 15.h),
              Text(
                item.description!,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
