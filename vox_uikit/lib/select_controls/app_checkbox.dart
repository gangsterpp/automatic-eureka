import 'package:flutter/material.dart';
import 'package:vox_uikit/helpers/app_icons.dart';
import 'package:vox_uikit/theme/app_colors.dart';

class AppCheckbox extends StatelessWidget {
  const AppCheckbox({
    required this.isChecked,
    this.isEnabled = true,
    super.key,
  });

  final bool isChecked;
  final bool isEnabled;

  static const double _size = 20;
  static const _animationDuration = Duration(milliseconds: 300);

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      crossFadeState:
          isChecked ? CrossFadeState.showSecond : CrossFadeState.showFirst,
      duration: _animationDuration,
      reverseDuration: _animationDuration,
      firstChild: SizedBox.square(
        dimension: _size,
        child: DecoratedBox(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: AppColors.gray150,
              width: 1,
            ),
          ),
        ),
      ),
      secondChild: SizedBox.square(
        dimension: _size,
        child: DecoratedBox(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isEnabled ? null : AppColors.gray150,
            gradient: !isEnabled
                ? null
                : const LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      AppColors.secondary300,
                      AppColors.secondary500,
                    ],
                  ),
          ),
          child: AnimatedScale(
            scale: isChecked ? 1 : 0,
            duration: _animationDuration,
            curve: Curves.elasticOut,
            child: const Icon(
              AppIcons.check,
              size: 16,
              color: AppColors.white,
            ),
          ),
        ),
      ),
    );
  }
}
