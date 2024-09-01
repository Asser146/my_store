import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/helpers/item_list_params.dart';
import 'package:my_store/core/theming/colors.dart';
import 'package:my_store/core/theming/styles.dart';
import 'package:my_store/core/widgets/my_app_bar.dart';

class ItemDetails extends StatefulWidget {
  final ItemsListParams params;
  const ItemDetails({Key? key, required this.params}) : super(key: key);

  @override
  _ItemDetailsState createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  @override
  Widget build(BuildContext context) {
    final item = widget.params.list[widget.params.index!];
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
              child: Image.network(item.image!),
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
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.title!,
                        style: TextStyles.font14darkrBold
                            .copyWith(color: Colors.white)
                            .copyWith(fontSize: 25.sp),
                      ),
                      SizedBox(height: 20.h),
                      Row(
                        children: [
                          for (int i = 0; i < 5; i++)
                            Icon(
                              item.rating!.rate! >= i + 1
                                  ? Icons.star
                                  : Icons.star_border,
                              color: item.rating!.rate! >= i + 1
                                  ? ColorsManager.selectedTabColor
                                  : Colors.grey[600],
                            ),
                          const Spacer(),
                          IconButton(
                            icon: Icon(
                              widget.params.isFav(item)
                                  ? Icons.favorite
                                  : Icons.favorite_outline,
                              color: widget.params.isFav(item)
                                  ? ColorsManager.inCartColor
                                  : null,
                              size: 25.sp,
                            ),
                            onPressed: () async {
                              await widget.params.toggleFav(item);
                              setState(() {});
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 15.h),
                      Text(
                        item.description!,
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
              await widget.params.toggleCart(item);

              setState(() {});
            },
            child: Container(
              color: ColorsManager.primaryColor,
              child: Container(
                height: 40.h,
                decoration: BoxDecoration(
                  color: widget.params.isCart(item)
                      ? ColorsManager.inCartColor
                      : ColorsManager.buttonColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(15.r),
                  ),
                ),
                width: double.infinity,
                child: Center(
                  child: Text(
                    widget.params.isCart(item) ? "In Cart" : "Ad to Cart",
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
  }
}
