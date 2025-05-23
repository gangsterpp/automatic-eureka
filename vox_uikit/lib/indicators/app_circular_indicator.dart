import 'package:flutter/material.dart';
import 'package:vox_uikit/theme/app_colors.dart';

enum _AppCircularIndicatorType { primary, white }

class AppCircularIndicator extends StatelessWidget {
  const AppCircularIndicator.primary({this.size = 15, super.key})
      : _indicatorType = _AppCircularIndicatorType.primary;

  const AppCircularIndicator.white({this.size = 15, super.key})
      : _indicatorType = _AppCircularIndicatorType.white;

  final _AppCircularIndicatorType _indicatorType;

  final double size;
  static const double thickness = 1.5;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: size,
      child: CircularProgressIndicator(
        strokeWidth: thickness,
        backgroundColor: AppColors.primary300,
        color: switch (_indicatorType) {
          _AppCircularIndicatorType.primary => AppColors.primary500,
          _AppCircularIndicatorType.white => AppColors.white,
        },
      ),
    );
  }
}
