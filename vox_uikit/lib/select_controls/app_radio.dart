import 'package:flutter/material.dart';
import 'package:vox_uikit/theme/app_colors.dart';

class AppRadio extends StatelessWidget {
  const AppRadio({
    required this.isSelected,
    super.key,
  });

  final bool? isSelected;

  static const double size = 20;
  static const double borderWidth = 1;
  static const double innerCircleSize = 14;
  static const _animationDuration = Duration(milliseconds: 300);

  @override
  Widget build(BuildContext context) {
    return isSelected == null
        ? const _DisabledRadio()
        : SizedBox.square(
            dimension: size,
            child: DecoratedBox(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  width: borderWidth,
                  color: isSelected == true
                      ? AppColors.secondary500
                      : AppColors.gray150,
                ),
              ),
              child: Center(
                child: AnimatedScale(
                  scale: isSelected == true ? 1 : 0,
                  duration: _animationDuration,
                  curve: Curves.bounceOut,
                  child: const SizedBox.square(
                    dimension: innerCircleSize,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            AppColors.secondary500,
                            AppColors.secondary300,
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
  }
}

class _DisabledRadio extends StatelessWidget {
  const _DisabledRadio();

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: AppRadio.size,
      child: DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            width: AppRadio.borderWidth,
            color: AppColors.gray150,
          ),
        ),
        child: const Center(
          child: SizedBox.square(
            dimension: AppRadio.innerCircleSize,
            child: DecoratedBox(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.gray150,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
