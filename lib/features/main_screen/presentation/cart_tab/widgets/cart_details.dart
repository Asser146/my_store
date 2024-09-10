// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:my_store/features/main_screen/presentation/cart_tab/cart_cubit/cart_cubit.dart';

// class CartDetails extends StatelessWidget {
//   const CartDetails({
//     super.key,
//   });
//   final double shippingCost = 8.00;
//   final double tax = 0.00;
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 30.w),
//       child: Column(
//         children: [
//           SizedBox(height: 12.h),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text("Subtotal", style: Theme.of(context).textTheme.bodyMedium),
//               Text("\$ ${context.watch<CartCubit>().sum}")
//             ],
//           ),
//           SizedBox(height: 20.h),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text("Shipping Cost",
//                   style: Theme.of(context).textTheme.bodyMedium),
//               Text("\$ $shippingCost")
//             ],
//           ),
//           SizedBox(height: 20.h),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text("Tax", style: Theme.of(context).textTheme.bodyMedium),
//               Text("\$ $tax")
//             ],
//           ),
//           SizedBox(height: 20.h),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text("Total", style: Theme.of(context).textTheme.bodyMedium),
//               Text(
//                 "\$ ${double.parse(context.watch<CartCubit>().sum) + shippingCost + tax}",
//                 style: Theme.of(context).textTheme.labelSmall,
//               )
//             ],
//           ),
//           SizedBox(height: 20.h),
//         ],
//       ),
//     );
//   }
// }
