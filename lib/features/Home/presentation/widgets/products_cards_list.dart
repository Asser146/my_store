import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/features/Home/presentation/widgets/item_card.dart';

class ProductsCardsList extends StatelessWidget {
  const ProductsCardsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.w,
            mainAxisSpacing: 5.h,
            childAspectRatio: 0.7,
          ),
          itemCount: 20,
          itemBuilder: (BuildContext context, int index) {
            return ItemCard(
              image: "",
              label: "Label $index",
              price: 20.0,
              description: "Description $index",
              salePrice: 0.0,
              id: "$index",
            );
          },
        ),
      ),
    );
  }
}
