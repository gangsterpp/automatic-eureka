import 'package:VOX/features/beginning/presentation/pages/auth/data/verification_service.dart';
import 'package:VOX/features/beginning/presentation/pages/auth/data/verification_service_provider.dart';
import 'package:VOX/features/beginning/presentation/pages/auth/singIn_screen.dart';
import 'package:VOX/features/beginning/presentation/pages/auth/widget/agree_button_widget.dart';
import 'package:VOX/features/beginning/presentation/pages/auth/widget/phone_number_widget/phone_number_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mockito/mockito.dart';

// Мок-сервис
class MockVerificationService extends Mock implements VerificationService {
  @override
  // TODO: implement apiUrl
  String? get apiUrl => throw UnimplementedError();

  @override
  Future<String?> checkVerificationCode(String uuid, String code) {
    // TODO: implement checkVerificationCode
    throw UnimplementedError();
  }

  @override
  Future<String?> sendVerificationCode(String phoneNumber,
      {String? gatewayId,
      String? channelType,
      String? destination,
      Map<String, String>? substitutions}) {
    // TODO: implement sendVerificationCode
    throw UnimplementedError();
  }
}

void main() {
  group('SignInScreen Test', () {
    testWidgets('Test handleVerification', (WidgetTester tester) async {
      final mockVerificationService = MockVerificationService();

      // Настройка мока для sendVerificationCode
      when(
        mockVerificationService.sendVerificationCode(
          '1234567890',
          gatewayId: 'test-gateway-id',
          channelType: 'sms',
          destination: 'destination',
        ),
      ).thenAnswer((_) async => 'test-uuid');

      // Настройка мока для checkVerificationCode
      when(
        mockVerificationService.checkVerificationCode('test-code', 'test-uuid'),
      ).thenAnswer((_) async => 'CONFIRMED');

      // Передаем мок-сервис в ProviderScope
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            verificationServiceProvider.overrideWithValue(
              mockVerificationService,
            ),
          ],
          child: const MaterialApp(home: SignInScreen()),
        ),
      );

      // Ввод номера телефона
      await tester.enterText(find.byType(PhoneNumberInput), '1234567890');
      await tester.pump();

      // Нажатие на кнопку Continue
      await tester.tap(find.byType(AgreeButton));
      await tester.pumpAndSettle(); // Убедитесь, что интерфейс обновился

      // Проверка, что SnackBar с сообщением "Код подтвержден!" отображается
      expect(find.text('Код подтвержден!'), findsOneWidget);

      // Проверка, что метод sendVerificationCode был вызван с правильными параметрами
      verify(
        mockVerificationService.sendVerificationCode(
          '1234567890',
          gatewayId: 'test-gateway-id',
          channelType: 'sms',
          destination: 'destination',
        ),
      ).called(1);

      // Проверка вызова checkVerificationCode
      verify(
        mockVerificationService.checkVerificationCode('test-code', 'test-uuid'),
      ).called(1);
    });
  });
}
