import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/routing/routes.dart';
import 'package:my_store/core/theming/styles.dart';
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
    return Container(
      height: MediaQuery.of(context).size.height, // Full screen height
      width: MediaQuery.of(context).size.width, // Full screen width

      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 150.h),
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Column(
                children: [
                  SizedBox(height: 35.h),
                  Text(
                    "A-Store",
                    // style: TextStyles.font26whiteRegular
                    //     .copyWith(color: Colors.black),
                  ),
                  SizedBox(height: 50.h),
                  TextField(
                    controller: usernameController,
                    decoration: const InputDecoration(labelText: 'Username'),
                  ),
                  SizedBox(height: 20.h),
                  TextField(
                    controller: passwordController,
                    decoration: const InputDecoration(labelText: 'Password'),
                    obscureText: true,
                  ),
                  SizedBox(height: 50.h),
                  LoginButton(
                      usernameController: usernameController,
                      passwordController: passwordController),
                  SizedBox(height: 15.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("New to A-Store?",
                          style: TextStyles.hintTextLightMode
                              .copyWith(fontSize: 18.sp)),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            Routes.register,
                          );
                        },
                        child: Text("Register",
                            style: TextStyles.hintTextLightMode
                                .copyWith(fontSize: 20.sp, color: Colors.blue)),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
