import 'package:flutter/material.dart';
import 'package:my_store/core/theming/colors.dart';
import 'package:my_store/core/widgets/my_app_bar.dart';
import 'package:my_store/features/Home/presentation/home_screen.dart';
import 'package:my_store/features/Search/search_screen.dart';
import 'package:my_store/features/main%20screen/domain/hive_services.dart';
import 'package:provider/provider.dart';
import 'package:my_store/features/Home/presentation/widgets/item_card_provider.dart';

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
        ],
      ),
      body: FutureBuilder<void>(
        future: _initFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ChangeNotifierProvider(
              create: (context) => ItemCardProvider(),
              child: IndexedStack(
                index: currentPageIndex,
                children: const <Widget>[
                  HomeScreen(),
                  SearchScreen(),
                  HomeScreen(), // Placeholder for Favourites screen
                  HomeScreen(), // Placeholder for Cart screen
                ],
              ),
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
