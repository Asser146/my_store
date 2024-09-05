import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/widgets/item_details/item_details_cubit/item_details_cubit.dart';
import 'package:my_store/core/widgets/item_details/widgets/item_description.dart';
import 'package:my_store/core/widgets/item_details/widgets/item_status_card.dart';
import 'package:my_store/core/widgets/item_details/widgets/quantity_card.dart';
import 'package:my_store/core/widgets/my_app_bar.dart';

class ItemDetailsScreen extends StatelessWidget {
  const ItemDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final item = context.watch<ItemDetailsCubit>().item;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const MyAppBar(),
      body: Column(
        children: [
          SizedBox(
            height: 200.h,
            width: double.infinity,
            child: Image.network(
              item.image!,
              fit: BoxFit.contain,
            ),
          ),
          Expanded(
            child: ItemDescription(item: item),
          ),
          QuantityCard(item: item),
          ItemStatusCard(item: item)
        ],
      ),
    );
  }
}
