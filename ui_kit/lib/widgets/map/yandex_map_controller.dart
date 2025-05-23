import 'package:yandex_maps_mapkit/mapkit.dart' as mapkit;
// ignore: implementation_imports
import 'package:yandex_maps_mapkit/src/bindings/image/image_provider.dart' as image_provider;

import 'app_map_controller.dart';
import 'place_mark_option.dart';

/// Контроллер для управления картой Yandex MapKit.
///
/// Позволяет добавлять, удалять и управлять маркерами и полигонами на карте.
class YandexMapController implements AppMapController<mapkit.MapWindow> {
  /// Окно карты Yandex MapKit.
  final mapkit.MapWindow _mapWindow;

  /// Коллекция объектов карты (маркер, полилиния и т.д.).
  final mapkit.MapObjectCollection _mapObjectCollection;

  /// Список всех маркеров на карте.
  final List<mapkit.PlacemarkMapObject> _placemarks = [];

  /// Список всех полилиний на карте.
  final List<mapkit.PolylineMapObject> _polylines = [];

  /// Создаёт контроллер для управления картой Yandex MapKit.
  YandexMapController(this._mapWindow) : _mapObjectCollection = _mapWindow.map.mapObjects.addCollection();

  /// Перемещает камеру карты к заданной позиции [position].
  @override
  Future<void> moveCameraToPosition(CameraPosition position) async {
    _mapWindow.map.moveWithAnimation(
      mapkit.CameraPosition(
        mapkit.Point(latitude: position.position.latitude, longitude: position.position.longitude),
        zoom: position.zoom,
        azimuth: position.azimuth,
        tilt: position.tilt,
      ),
      const mapkit.Animation(mapkit.AnimationType.Smooth, duration: 0.4),
    );
  }

  /// Возвращает "сырое" окно карты (MapWindow).
  @override
  mapkit.MapWindow get rawController => _mapWindow;

  /// Добавляет маркеры или полилинии на карту.
  ///
  /// [opts] — список опций для добавления (маркер, полилиния и т.д.).
  @override
  Future<void> addPlacemark(List<PlaceMarkOption> opts) async {
    for (final opt in opts) {
      switch (opt) {
        case YandexPlacemarkMapAssetImage yandex:
          final placemark = _mapObjectCollection.addPlacemarkWithImageStyle(
            yandex.point,
            image_provider.ImageProvider.fromImageProvider(yandex.data),
            yandex.iconStyle,
          );

          _placemarks.add(placemark);
          break;

        case YandexPlacemarkMapObjectMemoryImage data:
          final placemark = _mapObjectCollection.addPlacemarkWithImageStyle(
            data.point,
            image_provider.ImageProvider.fromImageProvider(data.data),
            data.iconStyle,
          );

          _placemarks.add(placemark);
          break;

        case YandexPlacemarkMapObjectFileImage data:
          final placemark = _mapObjectCollection.addPlacemarkWithImageStyle(
            data.point,
            image_provider.ImageProvider.fromImageProvider(data.data),
            data.iconStyle,
          );
          _placemarks.add(placemark);
          break;
        case YandexPlacemarkMapPolylines data:
          final polyline = mapkit.Polyline(data.points);
          final polylineObject = _mapObjectCollection.addPolylineWithGeometry(polyline);
          polylineObject
            ..setStrokeColor(data.strokeColor)
            ..style = data.lineStyle;
          _polylines.add(polylineObject);
          break;
        default:
          break;
      }
    }
  }

  /// Удаляет маркер или полилинию с карты.
  ///
  /// [opts] — опция для удаления (маркер, полилиния и т.д.).
  @override
  Future<void> removePlacemark(PlaceMarkOption opts) async {
    switch (opts) {
      case YandexMapObject yandex:
        _mapObjectCollection.remove(yandex.mapObject);
        _placemarks.remove(yandex.mapObject);
        break;

      default:
        break;
    }
  }

  /// Удаляет все маркеры с карты.
  Future<void> clearPlacemarks() async {
    for (final placemark in _placemarks) {
      _mapObjectCollection.remove(placemark);
    }
    _placemarks.clear();
  }

  /// Возвращает список всех маркеров на карте (только для чтения).
  List<mapkit.PlacemarkMapObject> get placemarks => List.unmodifiable(_placemarks);
}
