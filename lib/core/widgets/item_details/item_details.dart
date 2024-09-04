import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/theming/colors.dart';
import 'package:my_store/core/theming/styles.dart';
import 'package:my_store/core/widgets/item_details/details_quantity_controller.dart';
import 'package:my_store/core/widgets/item_details/item_details_cubit/item_details_cubit.dart';
import 'package:my_store/core/widgets/item_details/item_description.dart';
import 'package:my_store/core/widgets/my_app_bar.dart';

class ItemDetails extends StatelessWidget {
  const ItemDetails({super.key});

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
              context.watch<ItemDetailsCubit>().item.image!,
              fit: BoxFit.contain,
            ),
          ),
          ItemDescription(item: item),
          Container(
            color: Theme.of(context).cardColor,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
              child: GestureDetector(
                onTap: () async => await context
                    .read<ItemDetailsCubit>()
                    .toggleDetailsCart(item, 1),
                child: Container(
                  height: 35.h,
                  decoration: BoxDecoration(
                    color: context.watch<ItemDetailsCubit>().isDetailsCart(item)
                        ? ColorsManager.secondaryColor
                        : ColorsManager.addColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.r),
                    ),
                  ),
                  width: double.infinity,
                  child: context.watch<ItemDetailsCubit>().isDetailsCart(item)
                      ? DetailsQuantityController(item: item)
                      : Center(
                          child: Text("Add to Cart",
                              style: TextStyles.buttonTextWhite),
                        ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
