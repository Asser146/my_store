import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/theming/colors.dart';
import 'package:my_store/core/theming/styles.dart';
import 'package:my_store/core/widgets/cubit/item_details_cubit.dart';
import 'package:my_store/core/widgets/my_app_bar.dart';
import 'package:my_store/features/main_screen/data/item.dart';

class ItemDetails extends StatelessWidget {
  const ItemDetails(
      {super.key,
      required this.item,
      required this.isFav,
      required this.isCart,
      required this.toggleFav,
      required this.toggleCart});
  final Item item;
  final bool Function(Item) isFav;
  final bool Function(Item) isCart;

  final Future<void> Function(Item) toggleFav;
  final Future<void> Function(Item) toggleCart;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ItemDetailsCubit, ItemDetailsState>(
      builder: (context, state) {
        context.read<ItemDetailsCubit>().reInitialize();

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
                      context.watch<ItemDetailsCubit>().item.image!),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: ColorsManager.primaryColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.r),
                      topRight: Radius.circular(30.r),
                    ),
                  ),
                  width: double.infinity,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            context.watch<ItemDetailsCubit>().item.title!,
                            style: TextStyles.font14darkrBold
                                .copyWith(color: Colors.white)
                                .copyWith(fontSize: 25.sp),
                          ),
                          SizedBox(height: 20.h),
                          Row(
                            children: [
                              for (int i = 0; i < 5; i++)
                                Icon(
                                  context
                                              .watch<ItemDetailsCubit>()
                                              .item
                                              .rating!
                                              .rate! >=
                                          i + 1
                                      ? Icons.star
                                      : Icons.star_border,
                                  color: context
                                              .watch<ItemDetailsCubit>()
                                              .item
                                              .rating!
                                              .rate! >=
                                          i + 1
                                      ? ColorsManager.selectedTabColor
                                      : Colors.grey[600],
                                ),
                              const Spacer(),
                              IconButton(
                                icon: Icon(
                                  isFav(item)
                                      ? Icons.favorite
                                      : Icons.favorite_outline,
                                  color: isFav(item)
                                      ? ColorsManager.inCartColor
                                      : null,
                                  size: 25.sp,
                                ),
                                onPressed: () async {
                                  await toggleFav(item);
                                },
                              ),
                            ],
                          ),
                          SizedBox(height: 15.h),
                          Text(
                            context.watch<ItemDetailsCubit>().item.description!,
                            style: TextStyles.font15BlackMedium
                                .copyWith(color: Colors.white)
                                .copyWith(fontSize: 20.sp),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () async {
                  await toggleCart(item);
                },
                child: Container(
                  color: ColorsManager.primaryColor,
                  child: Container(
                    height: 40.h,
                    decoration: BoxDecoration(
                      color: isCart(item)
                          ? ColorsManager.inCartColor
                          : ColorsManager.buttonColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(15.r),
                      ),
                    ),
                    width: double.infinity,
                    child: Center(
                      child: Text(
                        isCart(item) ? "In Cart" : "Ad to Cart",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
