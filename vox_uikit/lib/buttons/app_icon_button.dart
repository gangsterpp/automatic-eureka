import 'package:flutter/material.dart';
import 'package:vox_uikit/main.dart';

enum _AppIconButtonType { primary, tertiary, white }

class AppIconButton extends StatelessWidget {
  const AppIconButton.primary({
    required this.onTapped,
    required this.icon,
    this.isLoading = false,
    super.key,
  }) : _buttonType = _AppIconButtonType.primary;

  const AppIconButton.tertiary({
    required this.onTapped,
    required this.icon,
    this.isLoading = false,
    super.key,
  }) : _buttonType = _AppIconButtonType.tertiary;

  const AppIconButton.white({
    required this.onTapped,
    required this.icon,
    this.isLoading = false,
    super.key,
  }) : _buttonType = _AppIconButtonType.white;

  final void Function()? onTapped;
  final bool isLoading;
  final IconData icon;
  final _AppIconButtonType _buttonType;

  static const double size = 44;
  static const double iconSize = 24;
  static const BorderRadius borderRadius =
      BorderRadius.all(Radius.circular(12));

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: !isLoading
          ? Icon(icon)
          : switch (_buttonType) {
              _AppIconButtonType.primary => const AppCircularIndicator.white(),
              _ => const AppCircularIndicator.primary(),
            },
      iconSize: iconSize,
      onPressed: onTapped,
      color: _getInitialActiveIconColor(),
      disabledColor: _getDisabledIconColor(),
      style: ButtonStyle(backgroundBuilder: (context, ws, iconWidget) {
        late final Color backgroundColor;
        if (isLoading) {
          backgroundColor = _getInitialLoadingBackgroundColor();
        } else if (ws.contains(WidgetState.disabled)) {
          backgroundColor = _getDisabledBackgroundColor();
        } else if (ws.contains(WidgetState.pressed)) {
          backgroundColor = _getActiveBackgroundColor();
        } else {
          backgroundColor = _getInitialLoadingBackgroundColor();
        }

        return Stack(
          alignment: Alignment.center,
          children: [
            if (_buttonType == _AppIconButtonType.white)
              _ElevatedFlatBase(backgroundColor)
            else
              _NeumorphBase(backgroundColor),
            iconWidget!,
          ],
        );
      }),
    );
  }

  Color _getInitialActiveIconColor() => switch (_buttonType) {
        _AppIconButtonType.primary => AppColors.white,
        _AppIconButtonType.tertiary => AppColors.gray900,
        _AppIconButtonType.white => AppColors.gray900,
      };

  Color _getDisabledIconColor() => switch (_buttonType) {
        _AppIconButtonType.primary => AppColors.primary100,
        _AppIconButtonType.tertiary => AppColors.gray200,
        _AppIconButtonType.white => AppColors.gray200,
      };

  Color _getInitialLoadingBackgroundColor() => switch (_buttonType) {
        _AppIconButtonType.primary => AppColors.primary500,
        _AppIconButtonType.tertiary => AppColors.gray100,
        _AppIconButtonType.white => AppColors.white,
      };

  Color _getActiveBackgroundColor() => switch (_buttonType) {
        _AppIconButtonType.primary => AppColors.primary600,
        _AppIconButtonType.tertiary => AppColors.gray150,
        _AppIconButtonType.white => AppColors.gray100,
      };

  Color _getDisabledBackgroundColor() => switch (_buttonType) {
        _AppIconButtonType.primary => AppColors.primary300,
        _AppIconButtonType.tertiary => AppColors.gray50,
        _AppIconButtonType.white => AppColors.gray100,
      };
}

/// Приподнятое плоское основание кнопки
class _ElevatedFlatBase extends StatelessWidget {
  const _ElevatedFlatBase(this.color);

  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: AppIconButton.size,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: AppIconButton.borderRadius,
          color: color,
          boxShadow: const [AppColors.iconButtonShadow],
        ),
      ),
    );
  }
}

/// Выпуклое основание со скругленной выступающей кромкой
class _NeumorphBase extends StatelessWidget {
  const _NeumorphBase(this.color);

  final Color color;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: AppIconButton.borderRadius,
      child: Stack(
        children: [
          const SizedBox.square(
            dimension: AppIconButton.size,
            child: ColoredBox(color: Colors.white),
          ),
          SizedBox.square(
            dimension: AppIconButton.size,
            child: ColoredBox(
              color: color.withValues(alpha: 0.5),
            ),
          ),
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: AppIconButton.borderRadius,
                boxShadow: [
                  BoxShadow(
                    color: color,
                    blurRadius: 6.0,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
            ),
          ),
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: AppIconButton.borderRadius,
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    color.withValues(alpha: 0),
                    color.withValues(alpha: 0),
                    Colors.black.withValues(alpha: 0.05),
                  ],
                  stops: const [0, 0.7, 1],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
