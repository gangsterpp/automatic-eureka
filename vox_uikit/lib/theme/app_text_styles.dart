import 'package:flutter/material.dart';
import 'package:vox_uikit/theme/app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  // static const _baseTextStyle = TextStyle(
  //   fontFamily: 'Lato',
  //   fontFamilyFallback: ['Roboto', 'sans-serif'],
  //   color: AppColors.gray900,
  // );

  static const s40h32w700$Accent = TextStyle(
    fontFamily: 'Lato',
    fontFamilyFallback: ['Roboto', 'sans-serif'],
    color: AppColors.gray900,
    fontSize: 40,
    height: 32 / 40,
    fontWeight: FontWeight.w700,
  );

  static const s32h32w700$Logo = TextStyle(
    fontFamily: 'Lato',
    fontFamilyFallback: ['Roboto', 'sans-serif'],
    color: AppColors.gray900,
    fontSize: 32,
    height: 32 / 32,
    fontWeight: FontWeight.w800,
  );

  static const s24h32w700$H1 = TextStyle(
    fontFamily: 'Lato',
    fontFamilyFallback: ['Roboto', 'sans-serif'],
    color: AppColors.gray900,
    fontSize: 24,
    height: 32 / 24,
    fontWeight: FontWeight.w700,
  );

  static const s20h28w700$H2 = TextStyle(
    fontFamily: 'Lato',
    fontFamilyFallback: ['Roboto', 'sans-serif'],
    color: AppColors.gray900,
    fontSize: 20,
    height: 28 / 20,
    fontWeight: FontWeight.w700,
  );

  static const s18h24w500$H3 = TextStyle(
    fontFamily: 'Lato',
    fontFamilyFallback: ['Roboto', 'sans-serif'],
    color: AppColors.gray900,
    fontSize: 18,
    height: 24 / 18,
    fontWeight: FontWeight.w500,
  );

  static const s16h20w500$BodyM = TextStyle(
    fontFamily: 'Lato',
    fontFamilyFallback: ['Roboto', 'sans-serif'],
    color: AppColors.gray900,
    fontSize: 16,
    height: 1.2,
    fontWeight: FontWeight.w500,
  );

  static const s14h16w400$BodyS = TextStyle(
    fontFamily: 'Lato',
    fontFamilyFallback: ['Roboto', 'sans-serif'],
    color: AppColors.gray900,
    fontSize: 14,
    height: 20 / 14,
    letterSpacing: -0.33,
    fontWeight: FontWeight.w400,
  );

  static const s14h20w500$Caption = TextStyle(
    fontFamily: 'Lato',
    fontFamilyFallback: ['Roboto', 'sans-serif'],
    color: AppColors.gray900,
    fontSize: 14,
    height: 20 / 14,
    fontWeight: FontWeight.w500,
  );

  static const s12h16w400$Label = TextStyle(
    fontFamily: 'Lato',
    fontFamilyFallback: ['Roboto', 'sans-serif'],
    color: AppColors.gray900,
    fontSize: 12,
    height: 1.2,
    fontWeight: FontWeight.w400,
  );

  static const s14h20w600$ButtonM = TextStyle(
    fontFamily: 'Lato',
    fontFamilyFallback: ['Roboto', 'sans-serif'],
    color: AppColors.gray900,
    fontSize: 14,
    height: 20 / 14,
    fontWeight: FontWeight.w600,
  );

  static const s12h20w600$ButtonS = TextStyle(
    fontFamily: 'Lato',
    fontFamilyFallback: ['Roboto', 'sans-serif'],
    color: AppColors.gray900,
    fontSize: 12,
    height: 20 / 12,
    fontWeight: FontWeight.w600,
  );

  // ---------------------------------------------------------------------------
  // static const TextStyle error = TextStyle(
  //   fontSize: 14,
  //   color: AppColors.error,
  // );
  //
  // MARK: - TextField Styles
  // static final BoxDecoration textFieldDecoration = BoxDecoration(
  //   color: AppColors.grayScale50,
  //   borderRadius: BorderRadius.circular(AppSizes.borderRadius12),
  //   boxShadow: const [
  //     BoxShadow(
  //       color: Color(0x0A000000),
  //       offset: Offset(0, -4),
  //       blurRadius: 10,
  //     ),
  //     BoxShadow(
  //       color: Color(0x66FFFFFF),
  //       offset: Offset(0, 4),
  //       blurRadius: 6,
  //     ),
  //   ],
  // );

  @Deprecated('Should be replaced with s14h16w400\$BodyS')
  static const TextStyle inputTextStyle = TextStyle(
    color: AppColors.grayScale950,
    fontSize: 14,
    fontFamily: 'Lato',
    fontWeight: FontWeight.w400,
    height: 1.4,
  );

  @Deprecated('Should be replaced with s14h16w400\$BodyS, and the replacement '
      'must include setting the color locally using the copyWith method')
  static const TextStyle hintTextStyle = TextStyle(
    color: AppColors.grayScale500,
    fontSize: 14,
    fontFamily: 'Lato',
    fontWeight: FontWeight.w400,
    height: 1.4,
  );
}
