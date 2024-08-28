import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/theming/styles.dart';
import 'package:my_store/features/main%20screen/presentation/widgets/items_cards_list.dart';
import 'package:provider/provider.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(child: Text("My Favourites", style: TextStyles.font24BlackBold)),
        SizedBox(height: 12.h),
        // ItemsCardsList(list: Provider.of<ItemCardProvider>(context).favorites),
      ],
    );
  }
}
