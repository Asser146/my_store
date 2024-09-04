import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/theming/styles.dart';
import 'package:my_store/core/widgets/item_details/item_details_cubit/item_details_cubit.dart';
import 'package:my_store/features/main_screen/data/item.dart';

class DetailsQuantityController extends StatelessWidget {
  const DetailsQuantityController({
    super.key,
    required this.item,
  });

  final Item item;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {
            context.read<ItemDetailsCubit>().toggleQuantity(item, -1);
          },
          icon: Icon(
            Icons.remove,
            color: Colors.black,
            size: 28.sp,
          ),
        ),
        Text(
          context
              .watch<ItemDetailsCubit>()
              .getDetailsQuantity(item.id!)
              .toString(),
          style: TextStyles.font26whiteRegular.copyWith(fontSize: 30.sp),
        ),
        IconButton(
          onPressed: () {
            context.read<ItemDetailsCubit>().toggleQuantity(item, 1);
          },
          icon: Icon(
            Icons.add,
            color: Colors.black,
            size: 28.sp,
          ),
        )
      ],
    );
  }
}
