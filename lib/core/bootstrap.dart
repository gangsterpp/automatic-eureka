// bootstrap.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:vox_ui_kit/widgets/map/map_bootstrap.dart';

typedef OnSuccess = void Function(ProviderContainer app);
typedef OnError = void Function(ProviderContainer app, String? error);

Future<void> bootstrap(OnSuccess onSuccess, OnError onError, {required MapBootstrap map}) async {
  // Создаем контейнер заранее, чтобы использовать его при возникновении ошибки.
  final container = ProviderContainer();
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await Permission.location.request();
    var permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {}
    }

    /// Инициализируем карту
    await map.inititalize();

    /// Вызываем callback
    onSuccess(container);
  } catch (e) {
    // Для логирования ошибки используется стандартная функция log().
    // Firebase пока не подключен, поэтому здесь применяется fallback‑решение.
    onError(container, e.toString());
  }
}
