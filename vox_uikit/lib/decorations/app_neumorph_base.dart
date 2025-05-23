import 'package:flutter/material.dart';
import 'package:vox_uikit/theme/app_colors.dart';

/// Выпуклое основание со скругленной выступающей кромкой
class AppNeumorphBase extends StatelessWidget {
  const AppNeumorphBase({
    required this.color,
    required this.borderRadius,
    this.contrast = 1,
    super.key,
  });

  final Color color;
  final BorderRadius borderRadius;
  final double contrast;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        ColoredBox(
          color: AppColors.gray150.withValues(
            red: AppColors.gray150.r / contrast,
            green: AppColors.gray150.g / contrast,
            blue: AppColors.gray150.b / contrast,
          ),
        ),
        DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.gray100.withValues(
                  red: AppColors.gray100.r / contrast,
                  green: AppColors.gray100.g / contrast,
                  blue: AppColors.gray100.b / contrast,
                ),
                AppColors.gray50.withAlpha(0),
                AppColors.gray50.withAlpha(0),
              ],
              stops: const [0, 0.2, 1],
            ),
          ),
        ),
        DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            boxShadow: [
              BoxShadow(
                color: color,
                blurRadius: 6,
                offset: const Offset(0, 2),
              ),
            ],
          ),
        ),
        DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.gray50.withAlpha(0),
                AppColors.gray50.withAlpha(0),
                AppColors.gray200.withValues(
                  alpha: 0.15,
                  red: AppColors.gray200.r * contrast,
                  green: AppColors.gray200.g * contrast,
                  blue: AppColors.gray200.b * contrast,
                ),
              ],
              stops: const [0, 0.7, 1],
            ),
          ),
        ),
      ],
    );
  }
}
