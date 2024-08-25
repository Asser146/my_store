import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/routing/routes.dart';
import 'package:my_store/core/theming/colors.dart';
import 'package:my_store/core/theming/styles.dart';
import 'package:my_store/features/Auth/login_cubit/login_cubit.dart';

class RegisterBody extends StatelessWidget {
  const RegisterBody({
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
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            ColorsManager.saerchTextFieldHintColor, // Start color
            Colors.green, // End color
          ],
        ),
      ),
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
                    style: TextStyles.font26whiteRegular
                        .copyWith(color: Colors.black),
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
                  ElevatedButton(
                      onPressed: () {
                        final username = usernameController.text;
                        final password = passwordController.text;
                        final token = username + password;

                        if (token.isNotEmpty) {
                          context.read<LoginCubit>().register(token);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Invalid credentials')),
                          );
                        }
                      },
                      child: Text('Register',
                          style: TextStyles.font24BlackBold
                              .copyWith(fontSize: 20.sp))),
                  SizedBox(height: 15.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Already Have an Account?",
                          style: TextStyles.font15BlackMedium
                              .copyWith(fontSize: 18.sp)),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Routes.login,
                              arguments: 1);
                        },
                        child: Text("Login",
                            style: TextStyles.font15BlackMedium
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
