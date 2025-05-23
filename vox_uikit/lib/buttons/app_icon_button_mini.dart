import 'package:flutter/material.dart';
import 'package:vox_uikit/main.dart';

enum _AppIconButtonMiniType { addPrimary, addTertiary, closeTertiary }

class AppIconButtonMini extends StatelessWidget {
  const AppIconButtonMini.addPrimary({
    required this.onTapped,
    this.isLoading = false,
    this.isDisabled = false,
    super.key,
  }) : _type = _AppIconButtonMiniType.addPrimary;

  const AppIconButtonMini.addTertiary({
    required this.onTapped,
    this.isLoading = false,
    this.isDisabled = false,
    super.key,
  }) : _type = _AppIconButtonMiniType.addTertiary;

  const AppIconButtonMini.closeTertiary({
    required this.onTapped,
    this.isLoading = false,
    this.isDisabled = false,
    super.key,
  }) : _type = _AppIconButtonMiniType.closeTertiary;

  final _AppIconButtonMiniType _type;
  final bool isLoading;
  final bool isDisabled;
  final void Function() onTapped;

  static const double _size = 24;
  static const _borderRadius = BorderRadius.all(Radius.circular(8));

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: isDisabled || isLoading ? null : onTapped,
      style: ButtonStyle(
        // padding: const WidgetStatePropertyAll(EdgeInsets.zero),
        shape: const WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: _borderRadius,
          ),
        ),
        visualDensity: const VisualDensity(
          horizontal: VisualDensity.minimumDensity,
          vertical: VisualDensity.minimumDensity,
        ),
        backgroundBuilder: (context, states, widget) {
          late final Color backgroundColor;
          late final Color borderColor;
          late final Color iconColor;
          if (states.contains(WidgetState.disabled)) {
            backgroundColor = _getDisabledBackgroundColor();
            borderColor = _getDisabledBorderColor();
            iconColor = _getDisabledIconColor();
          } else if (states.contains(WidgetState.pressed)) {
            backgroundColor = _getActiveBackgroundColor();
            borderColor = _getActiveBorderColor();
            iconColor = _getIconColor();
          } else {
            backgroundColor = _getIdleBackgroundColor();
            borderColor = _getIdleBorderColor();
            iconColor = _getIconColor();
          }

          return SizedBox.square(
            dimension: _size,
            child: isLoading
                ? const Center(child: AppCircularIndicator.primary(size: 18))
                : DecoratedBox(
                    decoration: BoxDecoration(
                      color: backgroundColor,
                      border: Border.all(color: borderColor, width: 1),
                      borderRadius: _borderRadius,
                    ),
                    child: Center(
                      child: Icon(
                        _getIcon(),
                        color: iconColor,
                        size: 16,
                      ),
                    ),
                  ),
          );
        },
      ),
      icon: const SizedBox.shrink(),
    );
  }

  // ЦВЕТ ФОНА:
  // ---------------------------------------------------------------------------
  Color _getIdleBackgroundColor() {
    return switch (_type) {
      _AppIconButtonMiniType.addPrimary => AppColors.primary500,
      _AppIconButtonMiniType.addTertiary => AppColors.gray50,
      _AppIconButtonMiniType.closeTertiary => AppColors.gray50,
    };
  }

  Color _getActiveBackgroundColor() {
    return switch (_type) {
      _AppIconButtonMiniType.addPrimary => AppColors.primary600,
      _AppIconButtonMiniType.addTertiary => AppColors.gray150,
      _AppIconButtonMiniType.closeTertiary => AppColors.gray150,
    };
  }

  Color _getDisabledBackgroundColor() {
    return switch (_type) {
      _AppIconButtonMiniType.addPrimary => AppColors.primary300,
      _AppIconButtonMiniType.addTertiary => AppColors.gray50,
      _AppIconButtonMiniType.closeTertiary => AppColors.gray50,
    };
  }

  // ЦВЕТ ГРАНИЦЫ:
  // ---------------------------------------------------------------------------
  Color _getIdleBorderColor() {
    return switch (_type) {
      _AppIconButtonMiniType.addPrimary => AppColors.primary500,
      _AppIconButtonMiniType.addTertiary => AppColors.gray150,
      _AppIconButtonMiniType.closeTertiary => AppColors.gray150,
    };
  }

  Color _getActiveBorderColor() {
    return switch (_type) {
      _AppIconButtonMiniType.addPrimary => AppColors.primary600,
      _AppIconButtonMiniType.addTertiary => AppColors.gray150,
      _AppIconButtonMiniType.closeTertiary => AppColors.gray150,
    };
  }

  Color _getDisabledBorderColor() {
    return switch (_type) {
      _AppIconButtonMiniType.addPrimary => AppColors.primary300,
      _AppIconButtonMiniType.addTertiary => AppColors.gray150,
      _AppIconButtonMiniType.closeTertiary => AppColors.gray150,
    };
  }

  // ЦВЕТ ИКОНКИ:
  // ---------------------------------------------------------------------------
  Color _getIconColor() {
    return switch (_type) {
      _AppIconButtonMiniType.addPrimary => AppColors.white,
      _AppIconButtonMiniType.addTertiary => AppColors.gray600,
      _AppIconButtonMiniType.closeTertiary => AppColors.gray900,
    };
  }

  Color _getDisabledIconColor() {
    return switch (_type) {
      _AppIconButtonMiniType.addPrimary => AppColors.primary100,
      _AppIconButtonMiniType.addTertiary => AppColors.gray200,
      _AppIconButtonMiniType.closeTertiary => AppColors.gray200,
    };
  }

  // ТИП ИКОНКИ:
  // ---------------------------------------------------------------------------
  IconData _getIcon() {
    return switch (_type) {
      _AppIconButtonMiniType.addPrimary => AppIcons.plus,
      _AppIconButtonMiniType.addTertiary => AppIcons.plus,
      _AppIconButtonMiniType.closeTertiary => AppIcons.cross,
    };
  }
}
