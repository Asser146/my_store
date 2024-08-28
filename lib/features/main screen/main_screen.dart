import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/core/theming/colors.dart';
import 'package:my_store/core/widgets/my_app_bar.dart';
import 'package:my_store/features/Cart/cart_screen.dart';
import 'package:my_store/features/Favourites/favourites_screen.dart';
import 'package:my_store/features/Home/presentation/home_screen.dart';
import 'package:my_store/features/Search/search_screen.dart';
import 'package:my_store/features/main%20screen/presentation/widgets/main_screen_cubit.dart';
import 'package:my_store/features/profile/profile_screen.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      bottomNavigationBar: BlocBuilder<MainScreenCubit, MainScreenState>(
        builder: (context, state) {
          final currentIndex = state is MainScreenTabChanged ? state.index : 0;

          return NavigationBar(
            onDestinationSelected: (int index) {
              context.read<MainScreenCubit>().changeTab(index);
            },
            indicatorColor: ColorsManager.cardColor,
            selectedIndex: currentIndex,
            destinations: const <NavigationDestination>[
              NavigationDestination(
                selectedIcon: Icon(Icons.home),
                icon: Icon(Icons.home_outlined),
                label: 'Home',
              ),
              NavigationDestination(
                icon: Icon(Icons.search),
                label: 'Search',
              ),
              NavigationDestination(
                icon: Icon(Icons.favorite),
                label: 'Favourites',
              ),
              NavigationDestination(
                icon: Icon(Icons.shopping_cart),
                label: 'Cart',
              ),
              NavigationDestination(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          );
        },
      ),
      body: BlocBuilder<MainScreenCubit, MainScreenState>(
        builder: (context, state) {
          final currentIndex = state is MainScreenTabChanged ? state.index : 0;

          return IndexedStack(
            index: currentIndex,
            children: const <Widget>[
              HomeScreen(),
              SearchScreen(),
              FavouritesScreen(),
              CartScreen(),
              ProfileScreen(),
            ],
          );
        },
      ),
    );
  }
}
