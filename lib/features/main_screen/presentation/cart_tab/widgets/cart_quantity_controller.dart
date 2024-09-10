// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:my_store/core/theming/colors.dart';
// import 'package:my_store/features/main_screen/data/item.dart';
// import 'package:my_store/features/main_screen/presentation/cart_tab/cart_cubit/cart_cubit.dart';

// class CartQuantityController extends StatelessWidget {
//   const CartQuantityController({
//     super.key,
//     required this.item,
//   });

//   final Item item;

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         ControlButton(item: item, direction: -1),
//         SizedBox(width: 8.w),
//         ControlButton(item: item, direction: 1)
//       ],
//     );
//   }
// }

// class ControlButton extends StatelessWidget {
//   const ControlButton({
//     super.key,
//     required this.item,
//     required this.direction,
//   });

//   final Item item;
//   final int direction;

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () => context.read<CartCubit>().toggleQuantity(item, direction),
//       child: Container(
//         decoration: const BoxDecoration(
//             shape: BoxShape.circle, color: ColorsManager.secondaryColor),
//         child: Padding(
//           padding: EdgeInsets.all(5.r),
//           child: Icon(
//             direction > 0 ? Icons.add : Icons.remove,
//             color: Theme.of(context).disabledColor,
//             size: 25.sp,
//           ),
//         ),
//       ),
//     );
//   }
// }
