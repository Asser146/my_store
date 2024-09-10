import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_store/core/theming/colors.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

List<PersistentBottomNavBarItem> navBarsItems(Color hintColor) {
  return [
    PersistentBottomNavBarItem(
      icon: const Icon(CupertinoIcons.home),
      title: "Home",
      activeColorPrimary: ColorsManager.secondaryColor,
      inactiveColorPrimary: hintColor,
    ),
    // PersistentBottomNavBarItem(
    //   icon: const Icon(CupertinoIcons.search),
    //   title: "Search",
    //   activeColorPrimary: ColorsManager.secondaryColor,
    //   inactiveColorPrimary: hintColor,
    // ),
    // PersistentBottomNavBarItem(
    //   icon: const Icon(CupertinoIcons.heart),
    //   title: "Favourites",
    //   activeColorPrimary: ColorsManager.secondaryColor,
    //   inactiveColorPrimary: hintColor,
    // ),
    // PersistentBottomNavBarItem(
    //   icon: const Icon(CupertinoIcons.cart),
    //   title: "Cart",
    //   activeColorPrimary: ColorsManager.secondaryColor,
    //   inactiveColorPrimary: hintColor,
    // ),
    PersistentBottomNavBarItem(
      icon: const Icon(CupertinoIcons.person),
      title: "Profile",
      activeColorPrimary: ColorsManager.secondaryColor,
      inactiveColorPrimary: hintColor,
    ),
  ];
}
