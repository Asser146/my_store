import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/core/theming/colors.dart';
import 'package:my_store/core/widgets/my_app_bar.dart';
import 'package:my_store/features/Cart/cart_screen.dart';
import 'package:my_store/features/Favourites/favourites_screen.dart';
import 'package:my_store/features/Home/presentation/home_cubit/home_cubit.dart';
import 'package:my_store/features/Home/presentation/home_screen.dart';
import 'package:my_store/features/Auth/login_cubit/login_cubit.dart';
import 'package:my_store/features/Search/search_screen.dart';
import 'package:my_store/features/main%20screen/domain/hive_services.dart';
import 'package:my_store/features/main%20screen/presentation/widgets/item_card_provider.dart';
import 'package:my_store/features/profile/profile_screen.dart';
import 'package:my_store/features/search/cubit/search_cubit.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentPageIndex = 0;
  late HiveServices _hiveServices;
  late Future<void> _initFuture;

  @override
  void initState() {
    super.initState();
    _hiveServices = HiveServices();
    _initFuture = _initializeHiveServices();
  }

  Future<void> _initializeHiveServices() async {
    await _hiveServices.init(); // Initialize Hive services
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: ColorsManager.cardColor,
        selectedIndex: currentPageIndex,
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
      ),
      body: FutureBuilder<void>(
        future: _initFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return IndexedStack(
              index: currentPageIndex,
              children: <Widget>[
                BlocProvider(
                  create: (context) => HomeCubit(),
                  child: const HomeScreen(),
                ),
                BlocProvider(
                  create: (context) => SearchCubit(),
                  child: const SearchScreen(),
                ),
                ChangeNotifierProvider(
                  create: (context) => ItemCardProvider(),
                  child: const FavouritesScreen(),
                ),
                ChangeNotifierProvider(
                  create: (context) => ItemCardProvider(),
                  child: const CartScreen(),
                ),
                BlocProvider(
                  create: (context) => LoginCubit(type: 0),
                  child: const ProfileScreen(),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Center(
                child: Text(
                    'Error initializing Hive services: ${snapshot.error}'));
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
