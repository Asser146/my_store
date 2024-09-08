import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/routing/routes.dart';
import 'package:my_store/core/theming/font_weight_helper.dart';
import 'package:my_store/features/auth/widgets/continue_with_button.dart';
import 'package:my_store/features/auth/widgets/custom_text_field.dart';
import 'package:my_store/features/auth/widgets/login_button.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({
    super.key,
    required this.usernameController,
    required this.passwordController,
  });

  final TextEditingController usernameController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 80.h),
          Text("Sign in",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontSize: 30.sp)),
          SizedBox(height: 30.h),
          CustomTextField(controller: usernameController, hintText: "Username"),
          SizedBox(height: 10.h),
          CustomTextField(controller: passwordController, hintText: "Password"),
          SizedBox(height: 15.h),
          LoginButton(
              usernameController: usernameController,
              passwordController: passwordController,
              submit: "Continue"),
          SizedBox(height: 10.h),
          Row(
            children: [
              Text("Don't have an Account?",
                  style: Theme.of(context).textTheme.titleSmall),
              SizedBox(width: 10.w),
              GestureDetector(
                onTap: () => Navigator.pushNamed(
                  context,
                  Routes.register,
                ),
                child: Text("Creat One",
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(fontWeight: FontWeightHelper.bold)),
              )
            ],
          ),
          SizedBox(height: 45.h),
          const ContinueWithButton(
              method: 'Google', path: 'Google - png 0.png'),
          SizedBox(height: 10.h),
          const ContinueWithButton(
              method: 'Facebook', path: 'Facebook - png 0.png'),
        ],
      ),
    );
  }
}
