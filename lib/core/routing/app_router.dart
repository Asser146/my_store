import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/core/routing/routes.dart';
import 'package:my_store/features/Auth/login_cubit/login_cubit.dart';
import 'package:my_store/features/Auth/login_screen.dart';
import 'package:my_store/features/Auth/register_screen.dart';
import 'package:my_store/features/main%20screen/main_screen.dart';

class AppRouter {
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.main:
        return MaterialPageRoute(builder: (_) => const MainScreen());
      case Routes.login:
        final int type = settings.arguments as int? ?? 0;
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => LoginCubit(
                      type: type), // Pass `type` to LoginCubit if needed
                  child: LoginScreen(), // Pass `type` to LoginScreen
                ));
      case Routes.register:
        final int type = settings.arguments as int? ?? 1;
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => LoginCubit(type: type),
                  child: const RegisterScreen(),
                ));
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
