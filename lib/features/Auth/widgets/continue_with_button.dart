import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContinueWithButton extends StatelessWidget {
  const ContinueWithButton({
    super.key,
    required this.method,
    required this.path,
  });
  final String method;
  final String path;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 45.h,
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.all(Radius.circular(20.r))),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Row(
          children: [
            Image.asset(
              "assets/images/$path",
            ),
            const Spacer(),
            Text(
              "Continue With $method",
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
