import 'package:flutter/material.dart';
import 'package:my_store/core/theming/colors.dart';
import 'package:my_store/core/theming/styles.dart';

var lightThemeData = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.white,
  scaffoldBackgroundColor: Colors.white,
  cardColor: ColorsManager.lightCardColor,
  hintColor: ColorsManager.cartDetailsLightColor,
  disabledColor: Colors.black,
  iconTheme: const IconThemeData(
    color: Colors.black,
    size: 20.0,
  ),
  textTheme: TextTheme(
      labelMedium: TextStyles.cardDetailsLightMode,
      labelSmall: TextStyles.cardSmallLabelLightMode,
      titleLarge: TextStyles.titleLargeLightMode,
      titleMedium: TextStyles.hintTextLightMode,
      bodySmall: TextStyles.cardDetailsLightMode),
);

var darkThemeData = ThemeData(
  brightness: Brightness.dark,
  primaryColor: ColorsManager.darkPrimaryColor,
  iconTheme: const IconThemeData(
    color: Colors.white, // Color for the icon
    size: 20.0, // Size of the icon
  ),
  disabledColor: Colors.white,
  scaffoldBackgroundColor: ColorsManager.darkPrimaryColor,
  cardColor: ColorsManager.darkCardColor,
  hintColor: ColorsManager.cartDetailsDarkColor,
  textTheme: TextTheme(
      labelMedium: TextStyles.cardDetailsDarkMode,
      labelSmall: TextStyles.cardSmallLabelDarkMode,
      titleLarge: TextStyles.titleLargeDarkMode,
      titleMedium: TextStyles.hintTextDarkMode,
      bodySmall: TextStyles.cardSmallLabelDarkMode),
);
