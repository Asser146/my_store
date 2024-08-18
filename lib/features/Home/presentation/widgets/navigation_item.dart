import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NavigationItem extends StatelessWidget {
  final IconData icon; // Use IconData for material icons
  final VoidCallback ontap;

  const NavigationItem({
    super.key,
    required this.icon,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Icon(
        icon,
        size: 35.r,
      ),
    );
  }
}
