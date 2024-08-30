import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/theming/styles.dart';
import 'package:my_store/core/widgets/items_cards_list.dart';
import 'package:my_store/features/main_screen/presentation/favourites_tab/favourite_cubit/favourite_cubit.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    context.read<FavouriteCubit>().favouritesInit();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(child: Text("My Favourites", style: TextStyles.font24BlackBold)),
        SizedBox(height: 12.h),
        ItemsCardsList(params: context.watch<FavouriteCubit>().getParams())
      ],
    );
  }
}
