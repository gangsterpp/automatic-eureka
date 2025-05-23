import 'package:flutter/material.dart';
import 'package:vox_uikit/theme/app_colors.dart';
import 'package:vox_uikit/theme/app_text_styles.dart';

enum _AppStepHeaderType { active, disabled, done }

class AppStepHeader extends StatelessWidget {
  const AppStepHeader.active({
    required this.index,
    required this.title,
    super.key,
  }) : _type = _AppStepHeaderType.active;

  const AppStepHeader.disabled({
    required this.index,
    required this.title,
    super.key,
  }) : _type = _AppStepHeaderType.disabled;

  const AppStepHeader.done({
    required this.index,
    required this.title,
    super.key,
  }) : _type = _AppStepHeaderType.done;

  final int index;
  final String title;
  final _AppStepHeaderType _type;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: BorderDirectional(
          bottom: BorderSide(
            color: _getBorderColor(),
            width: 1,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// Лейбл с индексом шага
            Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: ConstrainedBox(
                constraints: const BoxConstraints(minHeight: 20, minWidth: 20),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _getLabelBackground(),
                  ),
                  child: Center(
                    child: _type == _AppStepHeaderType.done
                        ? const Icon(
                            Icons.check,
                            color: AppColors.white,
                            size: 16,
                          )
                        : Text(
                            '$index',
                            style: AppTextStyles.s12h20w600$ButtonS.copyWith(
                              color: AppColors.white,
                            ),
                          ),
                  ),
                ),
              ),
            ),

            /// Заголовок шага
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                title,
                style: AppTextStyles.s14h16w400$BodyS.copyWith(
                  color: _getTextColor(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getBorderColor() {
    return switch (_type) {
      _AppStepHeaderType.disabled => AppColors.gray100,
      _ => AppColors.primary500,
    };
  }

  Color _getLabelBackground() {
    return switch (_type) {
      _AppStepHeaderType.disabled => AppColors.gray150,
      _ => AppColors.primary500,
    };
  }

  Color _getTextColor() {
    return switch (_type) {
      _AppStepHeaderType.disabled => AppColors.gray200,
      _ => AppColors.primary500,
    };
  }
}
