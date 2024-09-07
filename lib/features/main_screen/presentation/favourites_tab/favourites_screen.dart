import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/widgets/item_card_list/items_cards_list.dart';
import 'package:my_store/features/main_screen/presentation/favourites_tab/favourite_cubit/favourite_cubit.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: context.watch<FavouriteCubit>().params.list.isEmpty
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/search 1.png',
                  width: 200.w,
                  height: 200.h,
                ),
                Text(
                  "You don't have any..\nExplore more Items",
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.center,
                )
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                    child: Text("Favourites",
                        style: Theme.of(context).textTheme.titleLarge)),
                SizedBox(height: 12.h),
                ItemsCardsList(params: context.watch<FavouriteCubit>().params)
              ],
            ),
    );
  }
}
