import 'package:flutter/material.dart';

import '../../core/utils/app_colors.dart';

class DarkTheme {
   static ThemeData darkTheme = ThemeData(
     appBarTheme: const AppBarTheme(
       elevation: 0,
       backgroundColor: Colors.transparent
     ),
     primaryColor: AppColors.primary,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.scaffoldColor,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.navBarColor,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.unselectedNavBarIconColor,
      
    ),
  );
}