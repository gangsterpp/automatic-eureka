import 'package:flutter/material.dart';

import 'app_button_theme.dart';
import 'buttons_theme.dart';
import 'colors.dart';

abstract class AppTheme {
  static ThemeData get light => ThemeData(
    fontFamily: 'Lato',
    primaryColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    extensions: [
      AppButtonTheme(
        primaryElevatedButtonTheme: primaryElevatedButtonTheme,
        tertiaryElevatedButtonTheme: tertiaryElevatedButtonTheme,
        secondaryElevatedButtonTheme: secondaryElevatedButtonTheme,
        warningElevatedButtonTheme: warningElevatedButtonTheme,
        whiteElevatedButtonTheme: whiteElevatedButtonTheme,
        loginElevatedButtonTheme: loginElevatedButtonTheme,
      ),
    ],
    listTileTheme: ListTileThemeData(
      selectedTileColor: primaryColors.shade500,
      titleTextStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: Color(0xFF0B0C0E)),
    ),
    inputDecorationTheme: const InputDecorationTheme(border: InputBorder.none, contentPadding: EdgeInsets.zero),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: primaryColors.shade500,
      unselectedItemColor: const Color(0xFF81899C),
    ),
  );
}
