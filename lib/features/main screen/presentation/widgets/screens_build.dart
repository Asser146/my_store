import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/features/Cart/cart_screen.dart';
import 'package:my_store/features/Favourites/favourites_screen.dart';
import 'package:my_store/features/Home/presentation/home_cubit/home_cubit.dart';
import 'package:my_store/features/Home/presentation/home_screen.dart';
import 'package:my_store/features/profile/profile_screen.dart';
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
    const FavouritesScreen(),
    const CartScreen(),
    const ProfileScreen(),
  ];
}
