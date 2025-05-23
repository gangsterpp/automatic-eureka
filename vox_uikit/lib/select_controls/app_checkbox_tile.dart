import 'package:flutter/material.dart';
import 'package:vox_uikit/main.dart';
import 'package:vox_uikit/select_controls/app_checkbox.dart';

class AppCheckboxTile extends StatelessWidget {
  const AppCheckboxTile({
    required this.title,
    required this.value,
    required this.onChanged,
    this.lockButton,
    super.key,
  });

  /// Заголовок
  final String title;

  /// Флаг, указывающий, отмечен ли чекбокс.
  final bool value;

  /// Коллбэк, вызываемый при изменении состояния чекбокса. Возвращает новое значение типа boolean
  final void Function(bool) onChanged;

  /// Контролл, блокирующий
  final Widget? lockButton;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Stack(
        children: [
          /// Контент
          SizedBox(
            width: constraints.maxWidth,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 8,
                children: [
                  AppCheckbox(
                    isChecked: value,
                    isEnabled: lockButton == null,
                  ),
                  Expanded(
                    child: Text(
                      title,
                      style: AppTextStyles.s14h20w500$Caption.copyWith(
                        color: lockButton == null
                            ? AppColors.gray900
                            : AppColors.gray200,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          /// Нажималка
          if (lockButton == null)
            Positioned.fill(
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () => onChanged.call(!value),
                  overlayColor: WidgetStateProperty.all(
                    AppColors.primary300.withAlpha(30),
                  ),
                ),
              ),
            )
          else
            Positioned(
              top: -5,
              right: 4,
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      offset: Offset.zero,
                      color: AppColors.white,
                      blurRadius: 12,
                      spreadRadius: 8,
                    ),
                  ],
                ),
                child: lockButton,
              ),
            ),
        ],
      ),
    );
  }
}
