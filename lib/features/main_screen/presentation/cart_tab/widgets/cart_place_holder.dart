import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartPlaceHolder extends StatelessWidget {
  const CartPlaceHolder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/parcel 1.png',
          width: 200.w,
          height: 200.h,
        ),
        Text("Your Cart is Empty :(",
            style: Theme.of(context).textTheme.titleLarge)
      ],
    );
  }
}
