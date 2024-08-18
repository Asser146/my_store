import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/theming/colors.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    super.key,
    required this.image,
    required this.label,
    required this.price,
    required this.description,
    required this.salePrice,
    required this.id,
  });

  final String label, image, description, id;
  final double price, salePrice;

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
                width: 100.r,
                height: 100.r,
                "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg", // Use the image parameter
                fit: BoxFit.cover, // Ensure the image covers the container
              ),
            ),
            const Spacer(),
            Text(
              label,
              style: TextStyle(
                fontSize: 16.sp, // Font size with ScreenUtil
                fontWeight: FontWeight.bold, // Example style
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${price.toStringAsFixed(2)} \$",
                  style: TextStyle(
                    fontSize: 16.sp, // Font size with ScreenUtil
                    fontWeight: FontWeight.bold, // Example style
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                IconButton(
                  icon: Icon(
                    Icons.favorite_outline,
                    size: 25.sp,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {},
              child: Container(
                height: 40.h, // Adjusted height for better button appearance
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
                      fontSize: 16.sp, // Font size with ScreenUtil
                      fontWeight: FontWeight.bold, // Example style
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
