import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/routing/routes.dart';
import 'package:my_store/core/theming/colors.dart';
import 'package:my_store/core/theming/styles.dart';
import 'package:my_store/features/Login/login_cubit/login_cubit.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      body: BlocBuilder<LoginCubit, LoginState>(
        builder: (context, state) {
          if (state is Logined) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Navigator.pushNamed(context, Routes.main);
            });
            return const Center(child: CircularProgressIndicator());
          } else if (state is LoginInitial) {
            return const Center(child: CircularProgressIndicator());
          } else {
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
              child: Padding(
                padding: EdgeInsets.all(16.sp),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 160.h),
                      Text(
                        "A-Store",
                        style: TextStyles.font26whiteRegular,
                      ),
                      SizedBox(height: 90.h),
                      TextField(
                        controller: usernameController,
                        decoration:
                            const InputDecoration(labelText: 'Username'),
                      ),
                      TextField(
                        controller: passwordController,
                        decoration:
                            const InputDecoration(labelText: 'Password'),
                        obscureText: true,
                      ),
                      SizedBox(height: 10.h),
                      ElevatedButton(
                          onPressed: () {
                            final username = usernameController.text;
                            final password = passwordController.text;
                            final token = username + password;

                            if (token == "asser14") {
                              context.read<LoginCubit>().login(token);
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Invalid credentials')),
                              );
                            }
                          },
                          child: const Text('Login')),
                    ],
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
