import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/theming/colors.dart';
import 'package:my_store/core/theming/styles.dart';
import 'package:my_store/features/Home/data/item.dart';
import 'package:my_store/features/main%20screen/presentation/widgets/item_card_provider.dart';
import 'package:provider/provider.dart';

class ItemCard extends StatelessWidget {
  final Item item;

  const ItemCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final favoritesProvider = Provider.of<ItemCardProvider>(context);

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 6.h),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Image.network(
                    item.image!,
                    width: 100.r,
                    height: 100.r,
                    fit: BoxFit.cover,
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: Icon(
                      favoritesProvider.isFavorite(item)
                          ? Icons.favorite
                          : Icons.favorite_outline,
                      color: favoritesProvider.isFavorite(item)
                          ? ColorsManager.inCartColor
                          : null,
                      size: 25.sp,
                    ),
                    onPressed: () {
                      favoritesProvider.toggleFavorite(item);
                    },
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Text(
              item.title!,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Row(
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
                )
              ],
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              favoritesProvider.toggleCart(item);
            },
            child: Container(
              height: 40.h,
              decoration: BoxDecoration(
                color: favoritesProvider.inCart(item)
                    ? ColorsManager.inCartColor
                    : ColorsManager.buttonColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(15.r),
                ),
              ),
              width: double.infinity,
              child: Center(
                child: Text(
                  favoritesProvider.inCart(item) ? "In Cart" : "Add to Cart",
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
    );
  }
}
