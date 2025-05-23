import 'package:geolocator/geolocator.dart';

import 'place_mark_option.dart';

/// Позиция на карте — единая модель
base class CameraPosition {
  final Position position;
  final double zoom;
  final double azimuth;
  final double tilt;
  const CameraPosition({required this.position, this.zoom = 15.0, this.azimuth = 0.0, this.tilt = 30.0});
}

/// Универсальный контроллер
abstract interface class AppMapController<MapController> {
  /// «сырой» контроллер нативного плагина
  MapController get rawController;

  /// добавляет маркер
  Future<void> addPlacemark(List<PlaceMarkOption> opts);

  /// убирает маркер
  Future<void> removePlacemark(PlaceMarkOption opts);

  /// переместить камеру
  Future<void> moveCameraToPosition(CameraPosition position);
}
