import 'package:flutter/material.dart';
import 'package:vox_uikit/theme/app_colors.dart';
import 'package:vox_uikit/theme/app_sizes.dart';

class CustomButtonStyle {
  const CustomButtonStyle({
    required this.backgroundColor,
    required this.textColor,
    this.showShadow = true,
  });

  final Color backgroundColor;
  final Color textColor;
  final bool showShadow;

  static const primary = CustomButtonStyle(
    backgroundColor: AppColors.primary500,
    textColor: Colors.white,
  );

  static const disabled = CustomButtonStyle(
    backgroundColor: AppColors.primary300,
    textColor: AppColors.primary100,
  );

  static const white = CustomButtonStyle(
    backgroundColor: Colors.white,
    textColor: AppColors.gray900,
    showShadow: false,
  );

  static const gray = CustomButtonStyle(
    backgroundColor: AppColors.gray100,
    textColor: AppColors.gray900,
    showShadow: false,
  );

  static const onboarding = CustomButtonStyle(
    backgroundColor: AppColors.primary400,
    textColor: Colors.white,
    showShadow: false,
  );
}

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    super.key,
    required this.label,
    required this.onPressed,
    this.width = double.infinity,
    this.isActive = true,
    this.style = CustomButtonStyle.primary,
  });

  final String label;
  final VoidCallback? onPressed;
  final double width;
  final bool isActive;
  final CustomButtonStyle style;

  @override
  Widget build(BuildContext context) {
    final effectiveStyle = isActive ? style : CustomButtonStyle.disabled;

    return Container(
      width: width,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(AppSizes.borderRadius12),
        boxShadow: effectiveStyle.showShadow
            ? const [
                BoxShadow(
                  color: Color(0x0A000000),
                  offset: Offset(0, -4),
                  blurRadius: 10,
                ),
                BoxShadow(
                  color: Color(0x66FFFFFF),
                  offset: Offset(0, 4),
                  blurRadius: 6,
                ),
              ]
            : [],
      ),
      child: TextButton(
        onPressed: isActive ? onPressed : null,
        style: TextButton.styleFrom(
          backgroundColor: effectiveStyle.backgroundColor,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSizes.borderRadius12),
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontFamily: 'Lato',
            fontSize: 14,
            height: 1.43,
            fontWeight: FontWeight.w600,
            color: effectiveStyle.textColor,
          ),
        ),
      ),
    );
  }
}
