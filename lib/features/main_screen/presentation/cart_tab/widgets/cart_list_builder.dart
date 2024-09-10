// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:my_store/core/routing/routes.dart';
// import 'package:my_store/features/main_screen/presentation/cart_tab/widgets/horizontal_item_car.dart';
// import 'package:my_store/features/main_screen/data/item.dart';

// class CartListBuilder extends StatelessWidget {
//   const CartListBuilder({
//     super.key,
//     required this.list,
//   });

//   final List<Item> list;

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: ListView.separated(
//         separatorBuilder: (context, index) => SizedBox(
//           height: 5.h,
//         ),
//         physics: const BouncingScrollPhysics(),
//         itemCount: list.length,
//         itemBuilder: (BuildContext context, int index) {
//           return GestureDetector(
//               onTap: () => Navigator.of(context, rootNavigator: true)
//                   .pushNamed(Routes.details, arguments: list[index]),
//               child: HorizontaItemCar(item: list[index]));
//         },
//       ),
//     );
//   }
// }
