import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/features/Home/presentation/cubit/Item_card_cubit/item_card_cubit.dart';
import 'package:my_store/features/Home/presentation/widgets/item_card.dart';

class ItemsCardsList extends StatelessWidget {
  const ItemsCardsList({
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
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return BlocProvider(
              create: (context) => ItemCardCubit(),
              child: ItemCard(
                image:
                    "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
                label: "Label $index",
                price: 20.0,
                description: "Description $index",
                salePrice: 0.0,
                id: "$index",
              ),
            );
          },
        ),
      ),
    );
  }
}
