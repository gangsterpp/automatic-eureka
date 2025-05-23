class RemoteConfig {}

abstract class Args {}

/// Сервис для получения конфигурации из remote config.
///
/// При необходимости его можно переопределять, например, в тестах.
///
/// [Args] - аргументы для инициализации конфигурации.
///
/// [RemoteConfig] - конфигурация.
///
///
abstract interface class RemoteConfigService {
  const RemoteConfigService();

  /// Инициализация конфигурации.
  ///
  /// [args] - аргументы для инициализации конфигурации.
  Future<void> init({Args? args});

  /// Получение конфигурации.
  Future<RemoteConfig> fetch();
}

class MockRemoteConfigService implements RemoteConfigService {
  @override
  Future<void> init({Args? args}) async {}

  @override
  Future<RemoteConfig> fetch() async {
    return RemoteConfig();
  }
}
