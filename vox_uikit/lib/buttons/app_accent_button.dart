import 'package:flutter/material.dart';
import 'package:vox_uikit/main.dart';

enum AppAccentButtonType { primary, secondary, tertiary, warning }

class AppAccentButton extends StatelessWidget {
  const AppAccentButton({
    this.buttonType = AppAccentButtonType.primary,
    required this.text,
    this.isLoading = false,
    this.isDisabled = false,
    required this.onTapped,
    this.trailing,
    super.key,
  });

  const AppAccentButton.primary({
    required this.text,
    this.isLoading = false,
    this.isDisabled = false,
    required this.onTapped,
    this.trailing,
    super.key,
  }) : buttonType = AppAccentButtonType.primary;

  const AppAccentButton.secondary({
    required this.text,
    this.isLoading = false,
    this.isDisabled = false,
    required this.onTapped,
    super.key,
  })  : buttonType = AppAccentButtonType.secondary,
        trailing = null;

  const AppAccentButton.tertiary({
    required this.text,
    this.isLoading = false,
    this.isDisabled = false,
    required this.onTapped,
    super.key,
  })  : buttonType = AppAccentButtonType.tertiary,
        trailing = null;

  const AppAccentButton.warning({
    required this.text,
    this.isLoading = false,
    this.isDisabled = false,
    required this.onTapped,
    super.key,
  })  : buttonType = AppAccentButtonType.warning,
        trailing = null;

  final AppAccentButtonType buttonType;
  final String text;
  final VoidCallback? onTapped;
  final bool isDisabled;
  final bool isLoading;
  final Widget? trailing;

  static const double height = 44;
  static const double heightLarge = 56;
  static const borderRadius = BorderRadius.all(Radius.circular(12));

  @override
  Widget build(BuildContext context) {
    final textStyle = AppTextStyles.s14h20w600$ButtonM.copyWith(
      color: (onTapped == null) || isDisabled
          ? _getDisabledTextColor()
          : _getInitialActiveTextColor(),
    );

    return TextButton(
      onPressed: isDisabled ? null : onTapped,
      style: ButtonStyle(
        shape: const WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: borderRadius,
          ),
        ),
        visualDensity: const VisualDensity(
          horizontal: VisualDensity.minimumDensity,
          vertical: VisualDensity.minimumDensity,
        ),
        backgroundBuilder: (context, states, textWidget) {
          late final Color backgroundColor;
          if (isLoading) {
            backgroundColor = _getInitialLoadingBackgroundColor();
          } else if (states.contains(WidgetState.disabled)) {
            backgroundColor = _getDisabledBackgroundColor();
          } else if (states.contains(WidgetState.pressed)) {
            backgroundColor = _getActiveBackgroundColor();
          } else {
            backgroundColor = _getInitialLoadingBackgroundColor();
          }

          return ConstrainedBox(
            constraints: const BoxConstraints(minHeight: height),
            child: SizedBox(
              width: double.maxFinite,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned.fill(
                    child: AppNeumorphBase(
                      color: backgroundColor,
                      borderRadius: borderRadius,
                      contrast: 0.95,
                    ),
                  ),
                  textWidget!,
                ],
              ),
            ),
          );
        },
      ),
      child: isLoading
          ? switch (buttonType) {
              AppAccentButtonType.primary => const AppCircularIndicator.white(),
              _ => const AppCircularIndicator.primary(),
            }
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    text,
                    textAlign: TextAlign.center,
                    style: textStyle,
                  ),
                  if (trailing != null) trailing!,
                ],
              ),
            ),
    );
  }

  Color _getInitialActiveTextColor() => switch (buttonType) {
        AppAccentButtonType.primary => AppColors.white,
        AppAccentButtonType.secondary => AppColors.primary600,
        AppAccentButtonType.tertiary => AppColors.gray900,
        AppAccentButtonType.warning => AppColors.gray900,
      };

  Color _getDisabledTextColor() => switch (buttonType) {
        AppAccentButtonType.primary => AppColors.primary100,
        AppAccentButtonType.secondary => AppColors.primary300,
        AppAccentButtonType.tertiary => AppColors.gray200,
        AppAccentButtonType.warning => AppColors.gray200,
      };

  Color _getInitialLoadingBackgroundColor() => switch (buttonType) {
        AppAccentButtonType.primary => AppColors.primary500,
        AppAccentButtonType.secondary => AppColors.primary100,
        AppAccentButtonType.tertiary => AppColors.gray100,
        AppAccentButtonType.warning => AppColors.redLight500,
      };

  Color _getActiveBackgroundColor() => switch (buttonType) {
        AppAccentButtonType.primary => AppColors.primary600,
        AppAccentButtonType.secondary => AppColors.primary200,
        AppAccentButtonType.tertiary => AppColors.gray150,
        AppAccentButtonType.warning => AppColors.redLight600,
      };

  Color _getDisabledBackgroundColor() => switch (buttonType) {
        AppAccentButtonType.primary => AppColors.primary300,
        AppAccentButtonType.secondary => AppColors.primary100,
        AppAccentButtonType.tertiary => AppColors.gray50,
        AppAccentButtonType.warning => AppColors.redLight400,
      };
}
