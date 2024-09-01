import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/helpers/item_list_params.dart';
import 'package:my_store/core/routing/routes.dart';
import 'package:my_store/core/widgets/item_card/item_card.dart';

class ItemsCardsList extends StatelessWidget {
  const ItemsCardsList({
    super.key,
    required this.params,
  });

  final ItemsListParams params;

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
          itemCount: params.list.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context, rootNavigator: true)
                    .pushNamed(Routes.details, arguments: params.list[index]);
              },
              child: ItemCard(
                item: params.list[index],
                isFav: params.isFav,
                toggleFav: params.toggleFav,
                isCart: params.isCart,
                toggleCart: params.toggleCart,
              ),
            );
          },
        ),
      ),
    );
  }
}
