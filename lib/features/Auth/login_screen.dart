import 'package:flutter/material.dart';
import 'package:my_store/features/auth/widgets/login_body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
        body: SingleChildScrollView(
      child: LoginBody(
          usernameController: usernameController,
          passwordController: passwordController),
    ));
  }
}
