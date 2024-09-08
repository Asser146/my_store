import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/routing/routes.dart';
import 'package:my_store/core/theming/colors.dart';
import 'package:my_store/core/theming/styles.dart';
import 'package:my_store/features/auth/login_cubit/login_cubit.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
    required this.usernameController,
    required this.passwordController,
    required this.submit,
  });

  final TextEditingController usernameController;
  final TextEditingController passwordController;
  final String submit;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final username = usernameController.text;
        final password = passwordController.text;
        final token = username + password;

        if (token.isEmpty || !await context.read<LoginCubit>().login(token)) {
          await context.read<LoginCubit>().register(token);
          Navigator.of(context).pushNamed(Routes.main);
        } else {
          Navigator.of(context).pushNamed(Routes.main);
        }
      },
      child: Container(
        width: double.infinity,
        height: 45.h,
        decoration: BoxDecoration(
            color: ColorsManager.secondaryColor,
            borderRadius: BorderRadius.all(Radius.circular(25.r))),
        child: Center(
            child: Text(
          submit,
          style: TextStyles.buttonTextWhite,
        )),
      ),
    );
  }
}
