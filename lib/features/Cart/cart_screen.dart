import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/theming/styles.dart';
import 'package:my_store/features/main%20screen/widgets/item_card_provider.dart';
import 'package:my_store/features/main%20screen/widgets/items_cards_list.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(child: Text("Your Cart", style: TextStyles.font24BlackBold)),
        SizedBox(height: 12.h),
        ItemsCardsList(list: Provider.of<ItemCardProvider>(context).cartItems),
      ],
    );
  }
}
