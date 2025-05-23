import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notification_service.g.dart';

@riverpod
class NotificationService extends _$NotificationService {
  @override
  bool build() {
    final timer = Timer.periodic(const Duration(seconds: 100), (timer) {
      state = !state;
    });
    ref.onDispose(() {
      timer.cancel();
    });
    return true;
  }

  void hasActiveOrder() {
    state = true;
  }

  void noActiveOrder() {
    state = false;
  }
}
