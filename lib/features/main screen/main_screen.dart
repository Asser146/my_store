import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/core/theming/colors.dart';
import 'package:my_store/core/widgets/my_app_bar.dart';
import 'package:my_store/features/Home/presentation/home_cubit/home_cubit.dart';
import 'package:my_store/features/Home/presentation/home_screen.dart';
import 'package:my_store/features/Search/search_screen.dart';
import 'package:my_store/features/main%20screen/domain/hive_services.dart';
import 'package:my_store/features/search/cubit/search_cubit.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentPageIndex = 0;
  final HiveServices _hiveServices = HiveServices(); // Access the singleton
  late Future<void> _initFuture;
  late HomeCubit _homeCubit;
  late SearchCubit _searchCubit;

  @override
  void dispose() {
    _homeCubit.close();
    _searchCubit.close();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _homeCubit = HomeCubit(hiveServices: _hiveServices);
    _searchCubit = SearchCubit(hiveServices: _hiveServices);
    _initFuture = _initializeCubits();
  }

  Future<void> _initializeCubits() async {
    await _homeCubit.init(); // Initialize HomeCubit
    await _searchCubit.init(); // Initialize SearchCubit after HomeCubit
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
        ],
      ),
      body: FutureBuilder<void>(
        future: _initFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return IndexedStack(
              index: currentPageIndex,
              children: <Widget>[
                BlocProvider.value(
                  value: _homeCubit,
                  child: const HomeScreen(),
                ),
                BlocProvider.value(
                  value: _searchCubit,
                  child: const SearchScreen(),
                ),
                BlocProvider.value(
                  value: _homeCubit, // Use appropriate cubit if needed
                  child: const HomeScreen(),
                ),
                BlocProvider.value(
                  value: _homeCubit, // Use appropriate cubit if needed
                  child: const HomeScreen(),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Center(
                child: Text('Error initializing cubits: ${snapshot.error}'));
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
