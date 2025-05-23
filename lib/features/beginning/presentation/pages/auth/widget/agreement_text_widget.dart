import 'package:VOX/features/beginning/presentation/pages/auth/privacy_policy/privacy_policy_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:vox_ui_kit/core/theme/colors.dart';
import 'package:vox_ui_kit/core/theme/styles.dart';

// TODO: Не используйте функции при создании виджетов, имена функций всегда начинаются с маленьких букв.
// TODO: Не пишите ненужные комментарии

Text AgreementText(BuildContext context) {
  return Text.rich(
    TextSpan(
      text: 'Нажимая «Подтвердить», я прочитал и согласен \nс ',
      style:
          ThemeStyles.s14h400(ThemeColors.blueGray400), // Основной стиль текста
      children: [
        TextSpan(
          text: 'Политикой обработки персональных данных',
          style: ThemeStyles.s14h400lS33(ThemeColors.deepPurpleA20005),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              // Переход на другой экран
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      const PolicyScreen(), // Замените на ваш экран
                ),
              );
            },
        ),
      ],
    ),
    textAlign: TextAlign.center,
  );
}
