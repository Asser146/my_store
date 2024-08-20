import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/theming/colors.dart';
import 'package:my_store/features/Home/data/item.dart';
import 'package:my_store/features/main%20screen/items_list_cubit/items_list_cubit.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({super.key, required this.item});

  final Item item;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 0.4.sw,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.5.w,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(15.r),
        ),
        color: ColorsManager.cardColor,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 6.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                item.image!,
                width: 100.r,
                height: 100.r,
                fit: BoxFit.cover,
              ),
            ),
            const Spacer(),
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
                BlocBuilder<ItemsListCubit, ItemsListState>(
                  builder: (context, state) {
                    return IconButton(
                      icon: Icon(
                        context
                                .watch<ItemsListCubit>()
                                .isFavorite(item.id!.toString())
                            ? Icons.favorite
                            : Icons.favorite_outline,
                        size: 25.sp,
                      ),
                      onPressed: () {
                        context
                            .read<ItemsListCubit>()
                            .toggleFavorite(item.id!.toString());
                      },
                    );
                  },
                ),
              ],
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {},
              child: Container(
                height: 40.h,
                decoration: BoxDecoration(
                  color: ColorsManager.buttonColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(15.r),
                  ),
                ),
                width: double.infinity,
                child: Center(
                  child: Text(
                    "Add to Cart",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
