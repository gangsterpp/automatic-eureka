import 'package:flutter/material.dart';
import 'package:vox_uikit/theme/app_colors.dart';
import 'package:vox_uikit/theme/app_sizes.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      fontFamily: 'Lato',
      // глобальный шрифт
      scaffoldBackgroundColor: AppColors.background,
      splashColor: Colors.transparent,
      // ← отключает ripple-эффект
      colorScheme: const ColorScheme.light(
          // primary: AppColors.primary,
          // secondary: AppColors.accent,
          ),
      textTheme: const TextTheme(
          // bodyLarge: .body,
          // titleLarge: AppTextStyles.title,
          ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        centerTitle: true,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        elevation: 0,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.transparent,
        // backgroundColor: AppColors.background
        selectedItemColor: AppColors.primary600,
        unselectedItemColor: AppColors.grayScale500,
        selectedLabelStyle: TextStyle(
          fontSize: 12,
          height: 16 / 12,
          fontWeight: FontWeight.w400,
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: 12,
          height: 16 / 12,
          fontWeight: FontWeight.w400,
        ),
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: AppColors.white,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(AppSizes.bottomModalSheetRadius),
          ),
        ),
      ),
    );
  }

  static ThemeData get darkTheme => lightTheme;
}
