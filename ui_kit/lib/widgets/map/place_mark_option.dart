import 'package:flutter/painting.dart';
import 'package:yandex_maps_mapkit/mapkit.dart' as mapkit_map_icon_style;
// ignore: implementation_imports
import 'package:yandex_maps_mapkit/src/mapkit/map/map_object.dart' as mapkit_map_map_object;

/// Базовый класс для всех вариантов отображения маркера на карте.
sealed class PlaceMarkOption {
  /// Конструктор базового класса.
  const PlaceMarkOption();
}

/// Маркер, основанный на объекте карты Yandex MapKit.
class YandexMapObject implements PlaceMarkOption {
  /// Объект карты Yandex MapKit.
  final mapkit_map_map_object.MapObject mapObject;

  /// Конструктор.
  const YandexMapObject({required this.mapObject});
}

/// Маркер с иконкой из ассета (AssetImage).
class YandexPlacemarkMapAssetImage implements PlaceMarkOption {
  /// Иконка маркера из ассета.
  final AssetImage data;

  /// Стиль иконки.
  final mapkit_map_icon_style.IconStyle iconStyle;

  /// Географическая точка маркера.
  final mapkit_map_icon_style.Point point;

  /// Конструктор.
  const YandexPlacemarkMapAssetImage({required this.data, required this.iconStyle, required this.point});
}

/// Маркер с иконкой из памяти (MemoryImage).
class YandexPlacemarkMapObjectMemoryImage implements PlaceMarkOption {
  /// Иконка маркера из памяти.
  final MemoryImage data;

  /// Масштаб маркера (по умолчанию 1.0).
  final double scale;

  /// Стиль иконки.
  final mapkit_map_icon_style.IconStyle iconStyle;

  /// Географическая точка маркера.
  final mapkit_map_icon_style.Point point;

  /// Конструктор.
  const YandexPlacemarkMapObjectMemoryImage({required this.data, this.scale = 1.0, required this.iconStyle, required this.point});
}

/// Маркер с иконкой из файла (FileImage).
class YandexPlacemarkMapObjectFileImage implements PlaceMarkOption {
  /// Иконка маркера из файла.
  final FileImage data;

  /// Стиль иконки.
  final mapkit_map_icon_style.IconStyle iconStyle;

  /// Географическая точка маркера.
  final mapkit_map_icon_style.Point point;

  /// Конструктор.
  const YandexPlacemarkMapObjectFileImage({required this.data, required this.iconStyle, required this.point});
}

/// Маркер-полилиния (линия на карте).
class YandexPlacemarkMapPolylines implements PlaceMarkOption {
  /// Список точек для построения линии.
  final List<mapkit_map_icon_style.Point> points;

  /// Стиль линии.
  final mapkit_map_icon_style.LineStyle lineStyle;

  /// Цвет линии.
  final Color strokeColor;

  /// Конструктор.
  const YandexPlacemarkMapPolylines({required this.points, required this.lineStyle, required this.strokeColor});
}

/// Маркер с иконкой по пути к ассету.
class MarkerIcon implements PlaceMarkOption {
  /// Путь к иконке маркера.
  final String path;

  /// Конструктор.
  const MarkerIcon({required this.path});
}
