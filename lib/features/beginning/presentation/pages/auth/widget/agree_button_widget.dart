import 'package:VOX/features/beginning/presentation/pages/auth/code_screen.dart';
import 'package:VOX/features/beginning/presentation/pages/auth/data/send_call_verification.dart';
import 'package:VOX/features/beginning/presentation/pages/auth/singIn_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vox_uikit/buttons/app_accent_button.dart';

class AgreeButton extends ConsumerWidget {
  final Future<void> Function() onPressed;

  const AgreeButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final phoneNumber = ref.watch(phoneNumberProvider);

    return AppAccentButton.primary(
      text: 'Подтвердить',
      onTapped: () async {
        // Вызов переданной функции onPressed
        await onPressed();

        // Дополнительная логика, если необходимо
        debugPrint("Передано в `ContinueButton`: $phoneNumber");

        String cleanedPhoneNumber = phoneNumber.replaceAll(
          RegExp(r'[^0-9]'),
          '',
        );

        // Добавляем код страны, если его нет
        if (!cleanedPhoneNumber.startsWith("+")) {
          cleanedPhoneNumber = "+7$cleanedPhoneNumber";
        }

        debugPrint("Исходный номер телефона: $phoneNumber");
        debugPrint("Очищенный номер телефона: $cleanedPhoneNumber");

        if (cleanedPhoneNumber.isEmpty || cleanedPhoneNumber == "+7") {
          if (!context.mounted) return;
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Введите номер телефона')),
          );
          return;
        }

        if (cleanedPhoneNumber.length < 10) {
          if (!context.mounted) return;
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('Ошибка 1')));
          return;
        }
        if (!context.mounted) return;
        bool isCodeSent = await sendFlashCallVerification(
          context,
          cleanedPhoneNumber,
        );

        if (isCodeSent) {
          if (!context.mounted) return;
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CodeScreen(phoneNumber: cleanedPhoneNumber),
            ),
          );
        } else {
          if (!context.mounted) return;
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Ошибка отправки кода подтверждения')),
          );
        }
      },
    );
  }
}
