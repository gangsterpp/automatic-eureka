// main.dart
import 'dart:async';
import 'dart:developer';

import 'package:VOX/core/bootstrap.dart';
import 'package:VOX/customers_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vox_ui_kit/vox_ui_kit.dart';
import 'package:vox_ui_kit/widgets/map/map_bootstrap.dart';

void main() {
  runZonedGuarded(
    () {
      bootstrap(
        map: const YandexBootstrap(
          apiKey: String.fromEnvironment('MAP_API_KEY'),
          locale: 'ru_RU',
        ),
        (container) {
          runApp(
            TranslationProvider(
              child: UncontrolledProviderScope(
                container: container,
                child: const CustomersApp(),
              ),
            ),
          );
        },
        (container, error) {
          debugPrint('Ошибка при инициализации: $error');
          runApp(
            MaterialApp(
              home: Scaffold(
                body: Center(
                  child: Text(
                    'Произошла ошибка при инициализации: $error',
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ),
          );
        },
      );
    },
    (error, stackTrace) {
      log('Неперехваченная ошибка', error: error, stackTrace: stackTrace);
    },
  );
}
