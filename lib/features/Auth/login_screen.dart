import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/core/routing/routes.dart';
import 'package:my_store/features/auth/login_cubit/login_cubit.dart';
import 'package:my_store/features/auth/widgets/login_body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
          } else if (state is RegisterStarted) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Navigator.pushNamed(context, Routes.register);
            });
            return const Center(child: CircularProgressIndicator());
          } else {
            return SingleChildScrollView(
              child: LoginBody(
                  usernameController: usernameController,
                  passwordController: passwordController),
            );
          }
        },
      ),
    );
  }
}
