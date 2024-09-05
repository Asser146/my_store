import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/core/routing/routes.dart';
import 'package:my_store/core/widgets/item_details/item_details_cubit/item_details_cubit.dart';
import 'package:my_store/core/widgets/item_details/item_details_screen.dart';
import 'package:my_store/features/auth/login_cubit/login_cubit.dart';
import 'package:my_store/features/auth/login_screen.dart';
import 'package:my_store/features/auth/register_screen.dart';
import 'package:my_store/features/main_screen/data/item.dart';
import 'package:my_store/features/main_screen/main_screen.dart';

class AppRouter {
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.main:
        return MaterialPageRoute(builder: (_) => const MainScreen());
      case Routes.login:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => LoginCubit(),
                  child: const LoginScreen(),
                ));
      case Routes.register:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => LoginCubit(),
                  child: const RegisterScreen(),
                ));
      case Routes.details:
        final Item item = settings.arguments as Item;
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => ItemDetailsCubit(item),
                  child: const ItemDetailsScreen(),
                ),
            settings: settings);
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
