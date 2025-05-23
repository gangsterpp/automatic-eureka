import 'package:VOX/providers/app_storage.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'current_locale.g.dart';

@Riverpod(keepAlive: true)
class CurrentLocale extends _$CurrentLocale {
  @override
  Future<Locale> build() async {
    final loc = await ref.read(appStorageProvider).fetchLocale();

    return Locale(loc ?? 'ru');
  }

  Future<void> changeLocale(String locale) async {
    await ref.read(appStorageProvider).setLocale(locale);
    state = AsyncValue.data(Locale(locale));
  }
}
