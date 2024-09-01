import 'package:flutter/material.dart';
import 'package:my_store/core/theming/colors.dart';
import 'package:my_store/features/main_screen/presentation/widgets/nav_bar_items.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:my_store/core/widgets/my_app_bar.dart';

import 'presentation/widgets/screens_build.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: screenBuild(),
        items: navBarsItems(),
        confineToSafeArea: true,
        // backgroundColor: ColorsManager,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        stateManagement: false,
        hideNavigationBarWhenKeyboardAppears: true,
        backgroundColor: ColorsManager.primaryColor,

        navBarStyle: NavBarStyle.style3, // Adjust the style as needed
      ),
    );
  }
}
