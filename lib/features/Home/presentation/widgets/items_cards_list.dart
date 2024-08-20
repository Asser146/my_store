import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/features/Home/data/item.dart';
import 'package:my_store/features/Home/presentation/cubit/Item_card_cubit/item_card_cubit.dart';
import 'package:my_store/features/Home/presentation/widgets/item_card.dart';

class ItemsCardsList extends StatelessWidget {
  final List<Item> itemsList;

  const ItemsCardsList({super.key, required this.itemsList});
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
          itemCount: itemsList.length,
          itemBuilder: (BuildContext context, int index) {
            return BlocProvider(
              create: (context) => ItemCardCubit(),
              child: ItemCard(
                image: itemsList[index].image!,
                label: itemsList[index].title!,
                price: itemsList[index].price!,
                description: itemsList[index].description!,
                id: itemsList[index].id.toString(),
              ),
            );
          },
        ),
      ),
    );
  }
}
