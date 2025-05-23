import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import 'app_map_controller.dart';
import 'markers.dart';

/// Базовый абстрактный виджет для карт с поддержкой маркеров, перемещения камеры и жизненного цикла.
///
/// Используйте этот виджет как основу для реализации картографических компонентов.
/// Позволяет подписываться на события перемещения камеры, прогресса, а также управлять маркерами.
///
/// Пример наследования:
/// ```dart
/// class MyMapWidget extends DefaultMapWidget { ... }
/// ```
///
/// Основные параметры:
/// - [onCameraMove] — стрим сдвига камеры.
/// - [onCameraProgress] — колбэк прогресса сдвига.
/// - [markerStream] — стрим событий добавления/удаления маркеров.
/// - [arrowPath], [pinPath] — пути к иконкам маркеров.
///
/// {@category Карты}
abstract class DefaultMapWidget extends StatefulWidget {
  /// Стрим сдвига камеры.
  final Stream<CameraPosition> onCameraMove;

  /// Колбэк прогресса сдвига камеры.
  final void Function(bool inProgress) onCameraProgress;

  /// Стрим событий добавления/удаления маркеров.
  final Stream<({Marker marker, bool isAdd})>? markerStream;

  /// Путь к иконке стрелки.
  final String arrowPath;

  /// Цвет пина.
  final Color fillColor;

  /// Цвет круга точности.
  final Color strokeColor;

  /// Путь к иконке пина.
  final String pinPath;

  /// Радиус круга точности.
  final double accuracyCircleRadius;

  /// Конструктор.
  const DefaultMapWidget({
    super.key,
    required this.onCameraMove,
    required this.onCameraProgress,
    required this.markerStream,
    required this.arrowPath,
    required this.fillColor,
    required this.strokeColor,
    required this.pinPath,
    required this.accuracyCircleRadius,
  });

  @override
  State<DefaultMapWidget> createState();
}

/// Базовый State для картографических виджетов.
///
/// Реализует жизненный цикл карты, работу с контроллером и перемещение к текущей позиции.
///
/// Пример использования:
/// ```dart
/// class MyMapWidgetState extends DefaultMapWidgetState<MyMapWidget> {
///   ...
/// }
/// ```
///
/// {@category Карты}
abstract class DefaultMapWidgetState<T extends DefaultMapWidget> extends State<DefaultMapWidget> {
  late final AppLifecycleListener _lifecycleListener;
  late final Controller _controller;

  /// Контроллер карты.
  Controller get controller => _controller;

  /// Перемещает карту в текущую позицию.
  Future<void> moveToCurrentPosition({double zoom = 17.0, double azimuth = 150.0, double tilt = 30.0});

  /// Получает текущую позицию пользователя.
  Future<Position> getCurrentPosition(LocationSettings locationSettings) async {
    return await Geolocator.getCurrentPosition(locationSettings: locationSettings);
  }

  /// Возвращает виджет карты.
  Widget mapBuilder(BuildContext context);

  /// Останавливает mapkit.
  void stopMapkit();

  /// Возобновляет mapkit.
  void onResume();

  /// Запускает mapkit.
  void onStart();

  @override
  @mustCallSuper
  void initState() {
    _lifecycleListener = AppLifecycleListener(onInactive: stopMapkit, onHide: stopMapkit, onPause: stopMapkit, onResume: onResume);
    super.initState();
    _controller = Controller();

    onStart();
  }

  @override
  @mustCallSuper
  void dispose() {
    _controller.dispose();

    stopMapkit();
    _lifecycleListener.dispose();
    super.dispose();
  }

  @mustCallSuper
  @override
  Widget build(BuildContext context) => RepaintBoundary(child: mapBuilder(context));
}

class Controller extends ChangeNotifier {
  ControllerEvent _state = const Idle();

  ControllerEvent get state => _state;

  void setState(ControllerEvent state) {
    _state = state;
    notifyListeners();
  }
}

sealed class ControllerEvent {}

class Idle implements ControllerEvent {
  const Idle();
}

class MoveToCurrentPosition implements ControllerEvent {
  final double zoom;
  final double azimuth;
  final double tilt;

  const MoveToCurrentPosition({this.zoom = 17.0, this.azimuth = 150.0, this.tilt = 30.0});
}
