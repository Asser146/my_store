import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/features/cart_tab/cart_cubit/cart_cubit.dart';
import 'package:my_store/features/cart_tab/cart_screen.dart';
import 'package:my_store/features/favourites_tab/favourite_cubit/favourite_cubit.dart';
import 'package:my_store/features/favourites_tab/favourites_screen.dart';
import 'package:my_store/features/home_tab/presentation/home_cubit/home_cubit.dart';
import 'package:my_store/features/home_tab/presentation/home_screen.dart';
import 'package:my_store/features/profile_tab/profile_screen.dart';
import 'package:my_store/features/search/cubit/search_cubit.dart';
import 'package:my_store/features/search/search_screen.dart';

List<Widget> screenBuild() {
  return [
    BlocProvider(
      create: (context) => HomeCubit()..init(),
      child: const HomeScreen(),
    ),
    BlocProvider(
      create: (context) => SearchCubit()..init(),
      child: const SearchScreen(),
    ),
    BlocProvider(
      create: (context) => FavouriteCubit()..init(),
      child: const FavouritesScreen(),
    ),
    BlocProvider(
      create: (context) => CartCubit(),
      child: const CartScreen(),
    ),
    const ProfileScreen(),
  ];
}
