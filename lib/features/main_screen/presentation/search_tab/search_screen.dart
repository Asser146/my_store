// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:my_store/core/theming/styles.dart';
// import 'package:my_store/core/widgets/item_card_list/items_cards_list.dart';
// import 'package:my_store/features/main_screen/presentation/search_tab/cubit/search_cubit.dart';
// import 'package:my_store/features/main_screen/presentation/search_tab/widgets/search_text_field.dart';

// class SearchScreen extends StatelessWidget {
//   const SearchScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Theme.of(context).primaryColor,
//       child: Column(
//         children: [
//           SizedBox(height: 10.h),
//           const SearchTextField(),
//           SizedBox(height: 12.h),
//           context.watch<SearchCubit>().params.list.isEmpty
//               ? Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Image.asset(
//                       'assets/images/search 1.png',
//                       width: 200.w,
//                       height: 200.h,
//                     ),
//                     Text("Search for products",
//                         style: Theme.of(context).textTheme.titleLarge)
//                   ],
//                 )
//               : ItemsCardsList(params: context.watch<SearchCubit>().params)
//         ],
//       ),
//     );
//   }
// }
