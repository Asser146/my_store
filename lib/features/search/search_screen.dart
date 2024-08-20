import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/theming/styles.dart';
import 'package:my_store/features/Home/presentation/widgets/items_cards_list.dart';
import 'package:my_store/features/search/widgets/search_text_field.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SearchTextField(),
        SizedBox(height: 15.h),
        Text("Searched products", style: TextStyles.font24BlackBold),
        SizedBox(height: 12.h),
        // ItemsCardsList(),
      ],
    );
  }
}
