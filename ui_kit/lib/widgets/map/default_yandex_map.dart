import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:yandex_maps_mapkit/image.dart' as image_provider;
import 'package:yandex_maps_mapkit/mapkit.dart' as mapkit;
import 'package:yandex_maps_mapkit/mapkit_factory.dart' as mapkit_factory;
import 'package:yandex_maps_mapkit/mapkit_factory.dart' as mapkit_instance;
import 'package:yandex_maps_mapkit/src/mapkit/geometry/geometry.dart' as mapkit_geometry_geometry;
import 'package:yandex_maps_mapkit/yandex_map.dart' as map;

import 'app_map_controller.dart';
import 'default_map_widget.dart';
import 'markers.dart';
import 'place_mark_option.dart';
import 'yandex_map_controller.dart';

/// Виджет карты на базе Yandex MapKit с поддержкой маркеров и пользовательской локации.
///
/// Позволяет отображать карту, добавлять и удалять маркеры, а также работать с пользовательской локацией.
///
/// Пример использования:
/// ```dart
/// DefaultYandexMap(
///   onCameraMove: cameraMoveStream,
///   onCameraProgress: (inProgress) {},
///   markerStream: markerStream,
///   arrowPath: 'assets/icons/arrow.png',
///   pinPath: 'assets/icons/pin.png',
/// )
/// ```
///
/// Основные возможности:
/// - Добавление и удаление маркеров через стрим.
/// - Перемещение камеры.
/// - Отображение пользовательской локации с кастомными иконками.
/// - Управление жизненным циклом карты.
///
/// {@category Карты}
class DefaultYandexMap extends DefaultMapWidget {
  final void Function(YandexMapController controller) onControllerReady;

  /// [onCameraMove] — стрим сдвига карты.
  /// [onCameraProgress] — стрим прогресса сдвига карты.
  /// [markerStream] — стрим маркеров.
  /// [arrowPath] — путь к иконке стрелки.
  /// [pinPath] — путь к иконке пина.
  const DefaultYandexMap({
    super.key,
    required this.onControllerReady,
    required super.onCameraMove,
    required super.onCameraProgress,
    required super.markerStream,
    required super.arrowPath,
    required super.fillColor,
    required super.strokeColor,
    required super.pinPath,
    super.accuracyCircleRadius = 10,
  });

  @override
  State<DefaultMapWidget> createState() => _DefaultYandexMapState();
}

/// State для [DefaultYandexMap].
///
/// Реализует работу с контроллером Yandex MapKit, добавляет и удаляет маркеры, а также управляет пользовательской локацией.
///
/// Пример добавления маркера:
/// ```dart
/// // Добавить маркер
/// await addMarker(Marker(...));
/// // Удалить маркер
/// await removeMarker(Marker(...));
/// ```
///
/// Все события добавления/удаления маркеров обрабатываются автоматически через [markerStream].
///
/// {@category Карты}
class _DefaultYandexMapState extends DefaultMapWidgetState<DefaultYandexMap> implements mapkit.UserLocationObjectListener {
  YandexMapController? _controller;
  bool _isMapkitActive = false;

  StreamSubscription<({Marker marker, bool isAdd})>? _markerSubscription;

  @override
  void initState() {
    super.initState();
    widget.onCameraMove.listen((pos) async {
      widget.onCameraProgress(true);
      await _controller?.moveCameraToPosition(CameraPosition(position: pos.position, zoom: pos.zoom, azimuth: pos.azimuth, tilt: pos.tilt));
      widget.onCameraProgress(false);
    });
  }

  /// Добавляет маркер на карту по координатам
  Future<void> addMarker(Marker marker) async {
    switch (marker.data) {
      case YandexMapObject marker:
        break;
      case YandexPlacemarkMapAssetImage data:
        await _controller?.addPlacemark([data]);
      case YandexPlacemarkMapObjectMemoryImage data:
        await _controller?.addPlacemark([data]);
        break;
      case YandexPlacemarkMapObjectFileImage data:
        await _controller?.addPlacemark([data]);
        break;
      case MarkerIcon():
        break;
      case YandexPlacemarkMapPolylines data:
        await _controller?.addPlacemark([data]);
    }
    setState(() {});
  }

  Future<void> removeMarker(Marker marker) async {
    switch (marker.data) {
      case YandexMapObject marker:
        break;
      case YandexPlacemarkMapAssetImage data:
        await _controller?.removePlacemark(data);
      case YandexPlacemarkMapObjectMemoryImage data:
        await _controller?.removePlacemark(data);
        break;
      case YandexPlacemarkMapObjectFileImage data:
        await _controller?.removePlacemark(data);
        break;
      case MarkerIcon():
        break;
      case YandexPlacemarkMapPolylines data:
        await _controller?.removePlacemark(data);
    }
    setState(() {});
  }

  @override
  void onObjectAdded(mapkit.UserLocationView view) {
    view.arrow.setIcon(image_provider.ImageProvider.fromImageProvider(AssetImage(widget.arrowPath, package: 'vox_ui_kit')));
    view.arrow.visible = true;
    view.pin.setIcon(image_provider.ImageProvider.fromImageProvider(AssetImage(widget.pinPath, package: 'vox_ui_kit')));
    view.accuracyCircle.fillColor = widget.fillColor;
    view.accuracyCircle.strokeColor = widget.strokeColor;
    view.accuracyCircle.geometry = mapkit_geometry_geometry.Circle(view.pin.geometry, radius: widget.accuracyCircleRadius);
  }

  @override
  void onObjectRemoved(view) {}

  @override
  void onObjectUpdated(view, event) {}

  @override
  Widget mapBuilder(context) {
    return LayoutBuilder(
      builder: (_, c) {
        return map.YandexMap(
          onMapCreated: (v) {
            _controller = YandexMapController(v);
            (widget as DefaultYandexMap).onControllerReady(_controller!);
            _markerSubscription = widget.markerStream?.listen((marker) {
              if (marker.isAdd) {
                addMarker(marker.marker);
              } else {
                removeMarker(marker.marker);
              }
            });

            mapkit_factory.mapkit.createUserLocationLayer(_controller!.rawController)
              ..headingEnabled = true
              ..setVisible(true)
              ..setObjectListener(this);
          },

          platformViewType: map.PlatformViewType.Hybrid,
        );
      },
    );
  }

  @override
  void onResume() => onStart();

  @override
  void onStart() {
    if (!_isMapkitActive) {
      _isMapkitActive = true;
      mapkit_instance.mapkit.onStart();
      moveToCurrentPosition();
    }
  }

  @override
  void stopMapkit() {
    if (_isMapkitActive) {
      _isMapkitActive = false;
      mapkit_instance.mapkit.onStop();
    }
  }

  Future<Uint8List?> createMarkerWithText({
    required String text,
    required TextStyle style,
    required Color color,
    Offset offset = Offset.zero,
  }) async {
    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder);

    final paint = Paint()..color = color;

    final textSpan = TextSpan(text: text, style: style);

    final textPainter = TextPainter(text: textSpan, textDirection: TextDirection.ltr);
    textPainter.layout();

    final rect = Rect.fromLTWH(0, 0, textPainter.width + 20, textPainter.height + 20);
    canvas.drawRRect(RRect.fromRectAndRadius(rect, Radius.circular(10)), paint);
    textPainter.paint(canvas, offset);

    final picture = recorder.endRecording();
    final response = await picture.toImage(rect.width.toInt(), rect.height.toInt());
    final bytes = await response.toByteData();
    final uintList = bytes?.buffer.asUint8List();
    return uintList;
  }

  @override
  Future<void> moveToCurrentPosition({double zoom = 17.0, double azimuth = 0.0, double tilt = 30.0}) async {
    try {
      widget.onCameraProgress(true);
      final position = await getCurrentPosition(const LocationSettings(accuracy: LocationAccuracy.high, distanceFilter: 5));

      _controller?.moveCameraToPosition(CameraPosition(position: position, zoom: zoom, azimuth: azimuth, tilt: tilt));
    } finally {
      widget.onCameraProgress(false);
    }
  }

  @override
  void dispose() {
    _markerSubscription?.cancel();
    super.dispose();
  }
}
