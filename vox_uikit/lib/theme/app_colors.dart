import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // General colors
  static const Color background = Color(0xFFFFFFFF);
  static const Color white = Color(0xFFFFFFFF);

  // VOX Palette
  static const Color primary900 = Color(0xFF0C001A);
  static const Color primary600 = Color(0xFF6925D7);
  static const Color primary500 = Color(0xFF914DFF);
  static const Color primary400 = Color(0xFFAA76FF);
  static const Color primary300 = Color(0xFFCAA9FF);
  static const Color primary200 = Color(0xFFE9DCFF);
  static const Color primary100 = Color(0xFFF0E6FF);

  // VOX Secondary Palette
  static const Color secondary50 = Color(0xFFFFE5FC);
  static const Color secondary100 = Color(0xFFFFE5FC);
  static const Color secondary300 = Color(0xFFFF99F1);
  static const Color secondary500 = Color(0xFFFC5DE6);
  static const Color secondary600 = Color(0xFFCC00B1);

  // Gray Palette
  static const Color gray50 = Color(0xFFF8F9F9);
  static const Color gray100 = Color(0xFFF1F2F4);
  static const Color gray150 = Color(0xFFE2E4E9);
  static const Color gray200 = Color(0xFFA9AFBC);
  static const Color gray300 = Color(0xFF81899C);
  static const Color gray400 = Color(0xFF5A6172);
  static const Color gray600 = Color(0xFF434956);
  static const Color gray900 = Color(0xFF0B0C0E);
  static const Color grayScale50 = Color(0xFFF1F2F4);
  static const Color grayScale100 = Color(0xFFE2E4E9);
  static const Color grayScale150 = Color(0xFFE2E4E9);
  static const Color grayScale200 = Color(0xFFC6CAD2);
  static const Color grayScale300 = Color(0xFFA9AFBC);
  static const Color grayScale400 = Color(0xFF8D94A5);
  static const Color grayScale500 = Color(0xFF81899C);
  static const Color grayScale600 = Color(0xFF5A6172);
  static const Color grayScale700 = Color(0xFF434956);
  static const Color grayScale950 = Color(0xFF0B0C0E);

  // VOX Light Blue Colors
  static const Color lightBlue = Color(0xFFD9EBFC);

  // warning
  static const Color red = Color(0xFFF0214E);
  static const Color redLight400 = Color(0xFFFFF2F4);
  static const Color redLight500 = Color(0xFFFFECEE);
  static const Color redLight600 = Color(0xFFF5E3E5);

  // Main Palette
  static const Color main50 = Color(0xFFF2E5FF);
  static const Color main500 = Color(0xFF9633FF);
  static const Color main600 = Color(0xFF6300CC);
  static const Color main800 = Color(0xFF310066);

  // iOS Palette
  static const Color iosColor5 = Color(0xFF9C9CA3);

  // Support colors
  static const Color error = Color(0xFFD32F2F);
  static const Color appBarShadowColor = Color(0x24000000);
  static const Color shadowColor = Color(0x14000000); // чёрный с 8% прозрачности
  static const Color modalBackground = Color(0x40000019);

  // Unused colors
  static const Color surface = Color(0xFFF5F5F5);
  static const Color textPrimary = Color(0xFF212121);
  static const Color textSecondary = Color(0xFF757575);
  static const Color border = Color(0xFFE0E0E0);
  static const Color icon = Color(0xFF424242);

  static final chat = _ChatScreenColors();

  static const BoxShadow iconButtonShadow = BoxShadow(
    color: Color(0x14001A14),
    blurRadius: 12,
    offset: Offset(0, 6),
  );

  static const BoxShadow dialogShadow = BoxShadow(
    color: Color(0x1F0C001A),
    blurRadius: 32,
    offset: Offset(0, 0),
  );
}

class _ChatScreenColors {
  final LinearGradient circleAvatarGradient = const LinearGradient(
    colors: [Color(0xFFFF99F1), Color(0xFFFC5DE6)],
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
  );
}
