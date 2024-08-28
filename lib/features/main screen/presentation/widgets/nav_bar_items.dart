import 'package:flutter/cupertino.dart';
import 'package:my_store/core/theming/colors.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

List<PersistentBottomNavBarItem> navBarsItems() {
  return [
    PersistentBottomNavBarItem(
      icon: const Icon(CupertinoIcons.home),
      title: "Home",
      activeColorPrimary: ColorsManager.buttonColor,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(CupertinoIcons.search),
      title: "Search",
      activeColorPrimary: ColorsManager.buttonColor,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(CupertinoIcons.heart),
      title: "Favourites",
      activeColorPrimary: ColorsManager.buttonColor,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(CupertinoIcons.cart),
      title: "Cart",
      activeColorPrimary: ColorsManager.buttonColor,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(CupertinoIcons.person),
      title: "Profile",
      activeColorPrimary: ColorsManager.buttonColor,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
  ];
}
