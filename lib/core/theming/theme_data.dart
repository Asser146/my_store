import 'package:flutter/material.dart';
import 'package:my_store/core/theming/colors.dart';
import 'package:my_store/core/theming/styles.dart';

var lightThemeData = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.white,
  scaffoldBackgroundColor: Colors.white,
  cardColor: ColorsManager.lightCardColor,
  hintColor: ColorsManager.iconLightModeColor,
  disabledColor: Colors.black,
  textTheme: TextTheme(
      labelMedium: TextStyles.cardDetailsLightMode,
      labelSmall: TextStyles.cardSmallLabelLightMode,
      titleLarge: TextStyles.titleLargeLightMode,
      titleMedium: TextStyles.hintTextLightMode),
);

var darkThemeData = ThemeData(
  brightness: Brightness.dark,
  primaryColor: ColorsManager.darkPrimaryColor,
  disabledColor: Colors.white,
  scaffoldBackgroundColor: ColorsManager.darkPrimaryColor,
  cardColor: ColorsManager.darkCardColor,
  hintColor: ColorsManager.iconDarkModeColor,
  textTheme: TextTheme(
      labelMedium: TextStyles.cardDetailsDarkMode,
      labelSmall: TextStyles.cardSmallLabelDarkMode,
      titleLarge: TextStyles.titleLargeDarkMode,
      titleMedium: TextStyles.hintTextDarkMode),
);
