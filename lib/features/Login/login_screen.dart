import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/core/routing/routes.dart';
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
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: usernameController,
                    decoration: const InputDecoration(labelText: 'Username'),
                  ),
                  TextField(
                    controller: passwordController,
                    decoration: const InputDecoration(labelText: 'Password'),
                    obscureText: true,
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      final username = usernameController.text;
                      final password = passwordController.text;
                      final token = username + password;

                      if (token == "asser14") {
                        context.read<LoginCubit>().login(token);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Invalid credentials')),
                        );
                      }
                    },
                    child: const Text('Login'),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
