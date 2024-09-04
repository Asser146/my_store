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
          Container(
            height: 200.h,
            width: double.infinity,
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h),
              child: Image.network(
                context.watch<ItemDetailsCubit>().item.image!,
              ),
            ),
          ),
          ItemDescription(item: item),
          GestureDetector(
            onTap: () async {
              await context.read<ItemDetailsCubit>().toggleDetailsCart(item, 1);
            },
            child: Container(
              color: ColorsManager.darkPrimaryColor,
              child: Container(
                height: 40.h,
                decoration: BoxDecoration(
                  color: context.watch<ItemDetailsCubit>().isDetailsCart(item)
                      ? ColorsManager.secondaryColor
                      : ColorsManager.addColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(15.r),
                  ),
                ),
                width: double.infinity,
                child: context.watch<ItemDetailsCubit>().isDetailsCart(item)
                    ? DetailsQuantityController(item: item)
                    : Center(
                        child: Text("Add to Cart",
                            style: TextStyles.cardDetailsDarkMode),
                      ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
