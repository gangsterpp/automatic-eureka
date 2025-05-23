import 'package:flutter/material.dart';
import 'package:vox_uikit/main.dart';

enum AppPopUpType { noButton, oneButton, twoButtons, validated, confirmed }

class AppPopUp extends StatelessWidget {
  const AppPopUp._({
    required this.type,
    required this.title,
    this.message,
    this.onMainButtonTapped,
    this.mainButtonLabel,
    this.secondButtonLabel,
  });

  final AppPopUpType type;
  final String title;
  final String? message;
  final VoidCallback? onMainButtonTapped;
  final String? mainButtonLabel;
  final String? secondButtonLabel;

  // ---------------------------------------------------------------------------
  /// Крестик, заголовок и серый текст
  static Future<void> noButton(
    BuildContext context, {
    required String title,
    required String message,
  }) =>
      _show(
        context,
        builder: (context) => AppPopUp._(
          type: AppPopUpType.noButton,
          title: title,
          message: message,
        ),
      );

  /// Крестик, заголовок, серый текст и одна кнопка (вызывает коллбэк и возвращает true)
  static Future<bool?> oneButton(
    BuildContext context, {
    required String title,
    required String message,
    required String buttonLabel,
    VoidCallback? onButtonTapped,
  }) =>
      _show(
        context,
        builder: (context) => AppPopUp._(
          type: AppPopUpType.oneButton,
          title: title,
          message: message,
          mainButtonLabel: buttonLabel,
          onMainButtonTapped: onButtonTapped,
        ),
      );

  /// Крестик, заголовок, серый текст и две кнопки (одна закрывает, вторая вызывает коллбэк и возвращает true)
  static Future<bool?> twoButtons(
    BuildContext context, {
    required String title,
    required String message,
    required String secondButtonLabel,
    required String mainButtonLabel,
    VoidCallback? onMainButtonTapped,
  }) =>
      _show(
        context,
        builder: (context) => AppPopUp._(
          type: AppPopUpType.twoButtons,
          title: title,
          message: message,
          secondButtonLabel: secondButtonLabel,
          mainButtonLabel: mainButtonLabel,
          onMainButtonTapped: onMainButtonTapped,
        ),
      );

  /// Иконка-чек и заголовок
  static Future<void> validated(
    BuildContext context, {
    required String title,
  }) =>
      _show(
        context,
        builder: (context) => AppPopUp._(
          type: AppPopUpType.validated,
          title: title,
        ),
      );

  /// Крестик, иконка-чек и заголовок
  static Future<void> confirmed(
    BuildContext context, {
    required String title,
  }) =>
      _show(
        context,
        builder: (context) => AppPopUp._(
          type: AppPopUpType.confirmed,
          title: title,
        ),
      );

  // ---------------------------------------------------------------------------
  static Future<T?> _show<T>(
    BuildContext context, {
    required Widget Function(BuildContext) builder,
  }) =>
      showDialog<T>(
        context: context,
        useRootNavigator: true,
        barrierColor: AppColors.modalBackground,
        barrierDismissible: true,
        builder: builder,
      );

  // ---------------------------------------------------------------------------
  static const _borderRadius = BorderRadius.all(Radius.circular(20));

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 16),
      shape: const RoundedRectangleBorder(borderRadius: _borderRadius),
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: AppSizes.dialogMaxWidth,
        ),
        child: Stack(
          children: [
            /// Полезный контент
            Padding(
              padding: _getContentPadding(type),
              child: _Content(
                type: type,
                title: title,
                message: message,
                onMainButtonTapped: onMainButtonTapped,
                mainButtonLabel: mainButtonLabel,
                secondButtonLabel: secondButtonLabel,
              ),
            ),

            /// Кнопка-крестик в углу
            if (type != AppPopUpType.validated)
              Positioned(
                top: 12,
                right: 12,
                child: AppIconButtonMini.closeTertiary(
                  onTapped: () {
                    Navigator.pop(context);
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }

  EdgeInsetsGeometry _getContentPadding(AppPopUpType type) {
    return switch (type) {
      AppPopUpType.noButton => const EdgeInsets.fromLTRB(20, 40, 20, 40),
      AppPopUpType.oneButton => const EdgeInsets.fromLTRB(20, 40, 20, 20),
      AppPopUpType.twoButtons => const EdgeInsets.fromLTRB(20, 40, 20, 20),
      AppPopUpType.validated => const EdgeInsets.fromLTRB(20, 20, 20, 20),
      AppPopUpType.confirmed => const EdgeInsets.fromLTRB(20, 40, 20, 40),
    };
  }
}

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
class _Content extends StatelessWidget {
  const _Content({
    required this.type,
    required this.title,
    this.message,
    this.onMainButtonTapped,
    this.mainButtonLabel,
    this.secondButtonLabel,
  });

  final AppPopUpType type;
  final String title;
  final String? message;
  final VoidCallback? onMainButtonTapped;
  final String? mainButtonLabel;
  final String? secondButtonLabel;

  /// Когда показывать иконку
  bool get _isIconRequired =>
      type == AppPopUpType.validated || type == AppPopUpType.confirmed;

  bool get _isMessageRequired =>
      type == AppPopUpType.noButton ||
      type == AppPopUpType.oneButton ||
      type == AppPopUpType.twoButtons;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        /// Иконка (опционально)
        if (_isIconRequired)
          const Padding(
            padding: EdgeInsets.only(bottom: 8),
            child: Icon(
              AppIcons.checkRoundedFilled,
              color: AppColors.primary500,
              size: 40,
            ),
          ),

        /// Заголовок
        _Title(title),

        /// Сообщение (опционально)
        if (_isMessageRequired)
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: _Message(message!),
          ),

        /// Одна кнопка (опционально)
        if (type == AppPopUpType.oneButton)
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: AppAccentButton.primary(
              text: mainButtonLabel ?? '',
              onTapped: () => _onMainButtonTapped(context),
            ),
          ),

        /// Две кнопки (опционально)
        if (type == AppPopUpType.twoButtons)
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Row(
              children: [
                Expanded(
                  child: AppAccentButton.tertiary(
                    text: secondButtonLabel ?? '',
                    onTapped: () => _onSecondButtonTapped(context),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: AppAccentButton.primary(
                    text: mainButtonLabel ?? '',
                    onTapped: () => _onMainButtonTapped(context),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }

  // ---------------------------------------------------------------------------
  void _onMainButtonTapped(BuildContext context) {
    Navigator.pop(context);
    onMainButtonTapped?.call();
  }

  void _onSecondButtonTapped(BuildContext context) {
    Navigator.pop(context);
  }
}

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
class _Title extends StatelessWidget {
  const _Title(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: AppTextStyles.s16h20w500$BodyM.copyWith(
        color: AppColors.gray900,
      ),
    );
  }
}

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
class _Message extends StatelessWidget {
  const _Message(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: AppTextStyles.s12h16w400$Label.copyWith(
        color: AppColors.gray600,
      ),
    );
  }
}
