import 'package:flutter/material.dart';

class AppTheme {

    final Color _blueColor =  const Color(0xFF1225c1);
    final Color _lightBlueColor =  const Color(0xFFe7e9f8);
    final Color _gray =  const Color(0xFF616161);

  ThemeData appTheme() => ThemeData(
    useMaterial3: false,
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      elevation: 2,
      shadowColor: Colors.black.withOpacity(0.2),
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      iconTheme: IconThemeData(
        color: _blueColor
      ),
      titleTextStyle: TextStyle(
        color: _blueColor,
        fontSize: 24,
        fontWeight: FontWeight.w800
      )
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w800,
        color: _blueColor
      ),
      titleMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: _blueColor
      ),
      headlineLarge: const TextStyle(
        fontSize: 20
      ),
      headlineMedium: TextStyle(
        fontSize: 12,
        color: _gray
      ),
      labelMedium: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold
      )
    ),
    colorScheme: ColorScheme.light(
      primary: _blueColor,
      secondary: _lightBlueColor
    ),
    cardColor: const Color(0xFF7d8aff)
  );

  final Color _darkBlueColor =  const Color(0xFF7d8aff);
  final Color _darkLightGray =  const Color(0xFFe9e9e9);

  ThemeData appDarkTheme() => ThemeData(
    useMaterial3: false,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: Colors.black,
      iconTheme: IconThemeData(
        color: _darkBlueColor
      ),
      titleTextStyle: const TextStyle(
        color: Colors.white,
        fontSize: 24,
        fontWeight: FontWeight.w800
      )
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w800,
        color: _darkBlueColor
      ),
      titleMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: _darkBlueColor
      ),
      headlineLarge: const TextStyle(
        fontSize: 20
      ),
      headlineMedium: TextStyle(
        fontSize: 12,
        color: _darkLightGray
      ),
      labelMedium: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold
      )
    ),
    colorScheme: ColorScheme.dark(
      primary: _darkBlueColor,
      secondary: Colors.white
    ),  
    cardColor: const Color(0xFF7d8aff)
  );

}