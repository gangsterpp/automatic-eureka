import 'package:flutter/material.dart';

class AppButtonTheme extends ThemeExtension<AppButtonTheme> {
  final ElevatedButtonThemeData? primaryElevatedButtonTheme;
  final ElevatedButtonThemeData? tertiaryElevatedButtonTheme;
  final ElevatedButtonThemeData? secondaryElevatedButtonTheme;
  final ElevatedButtonThemeData? warningElevatedButtonTheme;
  final ElevatedButtonThemeData? whiteElevatedButtonTheme;
  final ElevatedButtonThemeData? loginElevatedButtonTheme;

  const AppButtonTheme({
    required this.primaryElevatedButtonTheme,
    required this.tertiaryElevatedButtonTheme,
    required this.secondaryElevatedButtonTheme,
    required this.warningElevatedButtonTheme,
    required this.whiteElevatedButtonTheme,
    required this.loginElevatedButtonTheme,
  });

  @override
  ThemeExtension<AppButtonTheme> copyWith({
    ElevatedButtonThemeData? primaryElevatedButtonTheme,
    ElevatedButtonThemeData? tertiaryElevatedButtonTheme,
    ElevatedButtonThemeData? secondaryElevatedButtonTheme,
    ElevatedButtonThemeData? warningElevatedButtonTheme,
    ElevatedButtonThemeData? whiteElevatedButtonTheme,
    ElevatedButtonThemeData? loginElevatedButtonTheme,
  }) {
    return AppButtonTheme(
      primaryElevatedButtonTheme: primaryElevatedButtonTheme ?? this.primaryElevatedButtonTheme,
      tertiaryElevatedButtonTheme: tertiaryElevatedButtonTheme ?? this.tertiaryElevatedButtonTheme,
      secondaryElevatedButtonTheme: secondaryElevatedButtonTheme ?? this.secondaryElevatedButtonTheme,
      warningElevatedButtonTheme: warningElevatedButtonTheme ?? this.warningElevatedButtonTheme,
      whiteElevatedButtonTheme: whiteElevatedButtonTheme ?? this.whiteElevatedButtonTheme,
      loginElevatedButtonTheme: loginElevatedButtonTheme ?? this.loginElevatedButtonTheme,
    );
  }

  @override
  ThemeExtension<AppButtonTheme> lerp(covariant ThemeExtension<AppButtonTheme>? other, double t) {
    if (other is! AppButtonTheme) {
      return this;
    }

    return AppButtonTheme(
      primaryElevatedButtonTheme: ElevatedButtonThemeData.lerp(primaryElevatedButtonTheme, other.primaryElevatedButtonTheme, t),
      tertiaryElevatedButtonTheme: ElevatedButtonThemeData.lerp(tertiaryElevatedButtonTheme, other.tertiaryElevatedButtonTheme, t),
      secondaryElevatedButtonTheme: ElevatedButtonThemeData.lerp(secondaryElevatedButtonTheme, other.secondaryElevatedButtonTheme, t),
      warningElevatedButtonTheme: ElevatedButtonThemeData.lerp(warningElevatedButtonTheme, other.warningElevatedButtonTheme, t),
      whiteElevatedButtonTheme: ElevatedButtonThemeData.lerp(whiteElevatedButtonTheme, other.whiteElevatedButtonTheme, t),
      loginElevatedButtonTheme: ElevatedButtonThemeData.lerp(loginElevatedButtonTheme, other.loginElevatedButtonTheme, t),
    );
  }
}
