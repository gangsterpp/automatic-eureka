import 'package:flutter/material.dart';
import 'package:vox_uikit/main.dart';

import 'app_circle_avatar.dart';

class AppPetPin extends StatelessWidget {
  const AppPetPin({
    required this.imageUrl,
    required this.isActive,
    required this.name,
    required this.onTapped,
    super.key,
  });

  /// URL изображения питомца
  final String? imageUrl;

  /// Имя питомца
  final String name;

  /// Флаг, указывающий, активен ли данный пин (влияет на цвет рамки и текста)
  final bool isActive;

  /// Кллбэк, вызываемый при нажатии на аватар
  final void Function() onTapped;

  static const double avatarDiameter = 60;
  static const _borderRadius = BorderRadius.all(Radius.circular(12));

  @override
  Widget build(BuildContext context) {
    final borderColor = isActive ? AppColors.primary500 : Colors.transparent;
    final textColor = isActive ? AppColors.primary500 : AppColors.gray900;

    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 4),
          child: SizedBox(
            width: 70,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 8,
              children: [
                DecoratedBox(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: !isActive
                        ? null
                        : Border.all(
                            color: borderColor,
                            width: 2.5,
                            strokeAlign: BorderSide.strokeAlignOutside,
                          ),
                  ),
                  child: AppCircleAvatar(
                    imageUrl: imageUrl,
                    diameter: avatarDiameter,
                    borderColor: borderColor,
                  ),
                ),
                Text(
                  name,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.s14h16w400$BodyS.copyWith(
                    color: textColor,
                  ),
                ),
              ],
            ),
          ),
        ),

        /// Нажималка
        Positioned.fill(
          child: Material(
            color: Colors.transparent,
            borderRadius: _borderRadius,
            child: InkWell(
              onTap: onTapped,
              borderRadius: _borderRadius,
              overlayColor: WidgetStateProperty.all(
                AppColors.primary300.withAlpha(30),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
