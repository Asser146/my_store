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
      body: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) async {
          if (context.watch<LoginCubit>().authState || state is Logined) {
            Navigator.pushNamed(context, Routes.main);
          } else if (state is RegisterStarted) {
            Navigator.pushNamed(context, Routes.register);
          }
        },
        child: BlocBuilder<LoginCubit, LoginState>(
          builder: (context, state) {
            if (state is LoginInitial) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return SingleChildScrollView(
                child: LoginBody(
                  usernameController: usernameController,
                  passwordController: passwordController,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
