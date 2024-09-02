import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/core/helpers/item_list_params.dart';
import 'package:my_store/core/routing/routes.dart';
import 'package:my_store/core/widgets/cubit/item_details_cubit.dart';
import 'package:my_store/core/widgets/item_card/item_details.dart';
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
                  create: (context) =>
                      LoginCubit(), // Pass `type` to LoginCubit if needed
                  child: const LoginScreen(), // Pass `type` to LoginScreen
                ));
      case Routes.register:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => LoginCubit(),
                  child: const RegisterScreen(),
                ));
      case Routes.details:
        final ItemsListParams params = settings.arguments as ItemsListParams;
        final item = params.item;
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => ItemDetailsCubit(item)..detailsInit(),
                  child: ItemDetails(
                    item: item!,
                    isFav: params.isFav,
                    isCart: params.isCart,
                    toggleFav: params.toggleFav,
                    toggleCart: params.toggleCart,
                  ),
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
