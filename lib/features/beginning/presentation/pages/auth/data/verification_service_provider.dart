import 'package:VOX/features/beginning/presentation/pages/auth/data/verification_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final verificationServiceProvider = Provider<VerificationService>((ref) {
  return VerificationService(); // Мы возвращаем реальный сервис в обычном случае
});
