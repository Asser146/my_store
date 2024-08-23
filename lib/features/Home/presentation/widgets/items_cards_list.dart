import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/features/Home/presentation/widgets/item_card.dart';
import 'package:my_store/features/Home/presentation/widgets/item_card_provider.dart';
import 'package:provider/provider.dart';

class ItemsCardsList extends StatelessWidget {
  const ItemsCardsList({super.key, required this.type});
  final int type;
  @override
  Widget build(BuildContext context) {
    final itemsProvider = Provider.of<ItemCardProvider>(context);
    final itemsList = type == 2
        ? itemsProvider.favorites
        : type == 3
            ? itemsProvider.cartItems
            : itemsProvider.items;
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
          itemCount: itemsList.length,
          itemBuilder: (BuildContext context, int index) {
            return ChangeNotifierProvider.value(
              value: itemsProvider, // Use the existing provider
              child: ItemCard(item: itemsList[index]),
            );
          },
        ),
      ),
    );
  }
}
