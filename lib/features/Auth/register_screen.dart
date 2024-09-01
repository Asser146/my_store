import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/core/routing/routes.dart';
import 'package:my_store/core/widgets/skeleton_list.dart';
import 'package:my_store/features/auth/login_cubit/login_cubit.dart';
import 'package:my_store/features/auth/widgets/register_body.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
        body: SingleChildScrollView(
      child: RegisterBody(
          usernameController: usernameController,
          passwordController: passwordController),
    ));
  }
}
