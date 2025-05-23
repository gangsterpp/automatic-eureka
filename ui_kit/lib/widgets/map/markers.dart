import 'dart:math';

import 'place_mark_option.dart';

/// Класс маркера для отображения на карте.
///
/// [T] — тип данных, наследуемый от [PlaceMarkOption], который содержит информацию о маркере (например, изображение, стиль и т.д.).
///
/// Пример использования:
/// ```dart
/// Marker<YandexPlacemarkMapObjectMemoryImage>(
///   latitude: 59.94,
///   longitude: 30.31,
///   data: myPlacemarkData,
/// )
/// ```
base class Marker<T extends PlaceMarkOption> {
  /// Географическая широта маркера.
  final double latitude;

  /// Географическая долгота маркера.
  final double longitude;

  /// Данные маркера (например, изображение, стиль и т.д.).
  final T data;

  /// Точка привязки маркера (anchor), если требуется смещение относительно координат.
  final Point<double>? anchor;

  /// Масштаб маркера (по умолчанию 1.0).
  final double scale;

  /// Конструктор маркера.
  const Marker({required this.latitude, required this.longitude, required this.data, this.anchor, this.scale = 1.0});
}
