import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'app_storage.g.dart';

@riverpod
SharedPreferencesAsync sharedPreferencesAsync(Ref ref) {
  return SharedPreferencesAsync();
}

@riverpod
AppStorage appStorage(Ref ref) {
  return AppStorage(ref.watch(sharedPreferencesAsyncProvider));
}

base class AppStorage {
  final SharedPreferencesAsync _storage;
  const AppStorage(this._storage);

  Future<bool> isFirstEnter() async {
    final isFirstEnter = await _storage.getBool('isFirstEnter');
    return isFirstEnter ?? true;
  }

  Future<void> setFirstEnter() async {
    await _storage.setBool('isFirstEnter', false);
  }

  Future<void> unsetFirstEnter() async {
    await _storage.setBool('isFirstEnter', true);
  }

  Future<void> clear() async {
    await _storage.clear();
  }

  Future<String?> fetchLocale() async {
    return await _storage.getString('locale');
  }

  Future<void> setLocale(String locale) async {
    await _storage.setString('locale', locale);
  }

  Future<void> setCustomValue(String key, String value) {
    return _storage.setString(key, value);
  }

  Future<String?> fetchCustomValue(String key) {
    return _storage.getString(key);
  }

  Future<void> removeCustomValue(String key) {
    return _storage.remove(key);
  }

  Future<List<String>?> fetchCustomList(String key) {
    return _storage.getStringList(key);
  }

  Future<void> setCustomList(String key, List<String> value) {
    return _storage.setStringList(key, value);
  }

  Future<void> removeCustomList(String key) {
    return _storage.remove(key);
  }

  Future<void> setShowPopup() {
    return _storage.setBool('walk_popup', false);
  }

  Future<bool> fetchShowPopup() async {
    return await _storage.getBool('walk_popup') ?? true;
  }

  Future<void> unsetShowPopup() {
    return _storage.remove('walk_popup');
  }
}
