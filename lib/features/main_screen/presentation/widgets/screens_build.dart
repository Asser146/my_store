import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/features/main_screen/presentation/cart_tab/cart_cubit/cart_cubit.dart';
import 'package:my_store/features/main_screen/presentation/cart_tab/cart_screen.dart';
import 'package:my_store/features/main_screen/presentation/favourites_tab/favourite_cubit/favourite_cubit.dart';
import 'package:my_store/features/main_screen/presentation/favourites_tab/favourites_screen.dart';
import 'package:my_store/features/main_screen/presentation/home_tab/home_cubit/home_cubit.dart';
import 'package:my_store/features/main_screen/presentation/home_tab/home_screen.dart';
import 'package:my_store/features/main_screen/presentation/profile_tab/cubit/profile_cubit.dart';
import 'package:my_store/features/main_screen/presentation/profile_tab/profile_screen.dart';
import 'package:my_store/features/main_screen/presentation/search_tab/cubit/search_cubit.dart';
import 'package:my_store/features/main_screen/presentation/search_tab/search_screen.dart';

List<Widget> screenBuild() {
  return [
    BlocProvider(
      create: (context) => HomeCubit(),
      child: const HomeScreen(),
    ),
    BlocProvider(
      create: (context) => SearchCubit(),
      child: const SearchScreen(),
    ),
    BlocProvider(
      create: (context) => FavouriteCubit(),
      child: const FavouritesScreen(),
    ),
    BlocProvider(
      create: (context) => CartCubit(),
      child: const CartScreen(),
    ),
    BlocProvider(
      create: (context) => ProfileCubit(),
      child: const ProfileScreen(),
    ),
  ];
}
