import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'authorize.g.dart';

@Riverpod(keepAlive: true)
class AuthorizeNotifier extends _$AuthorizeNotifier {
  @override
  AuthorizeState build() => const AuthorizeState.initial();

  /// Метод для авторизации пользователя.
  void login() {
    state = const AuthorizeState.authorized();
  }

  /// Метод для выхода из системы.
  void logout() {
    state = const AuthorizeState.unauthorized();
  }
}

/// Использование sealed class и factory-конструкторов для представления состояний.
sealed class AuthorizeState {
  const AuthorizeState();

  /// Начальное состояние (например, когда статус ещё не определён).
  const factory AuthorizeState.initial() = Initial;

  /// Состояние, когда пользователь авторизован.
  const factory AuthorizeState.authorized() = Authorized;

  /// Состояние, когда пользователь не авторизован.
  const factory AuthorizeState.unauthorized() = Unauthorized;
}

class Initial extends AuthorizeState {
  const Initial();
}

class Authorized extends AuthorizeState {
  const Authorized();
}

class Unauthorized extends AuthorizeState {
  const Unauthorized();
}
