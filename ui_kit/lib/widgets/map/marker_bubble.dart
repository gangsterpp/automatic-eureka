import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';
import 'package:yandex_maps_mapkit/mapkit.dart' as mapkit;

import '../../gen/assets.gen.dart';
import '../../theme/app_text.dart';
import '../../theme/colors.dart';
import 'place_mark_option.dart';

/// Виджет для отображения информационного пузыря маркера на карте.
///
/// Принимает поток [bubbleDataStream] с данными для обновления содержимого пузыря,
/// а также колбэк [onScreenShot], который вызывается при успешном создании скриншота виджета.
/// [bubbleData] — начальные данные для отображения.
class MarkerBubble extends StatefulWidget {
  /// Поток с данными для обновления содержимого пузыря.
  final Stream<BubbleData> bubbleDataStream;

  /// Колбэк, вызываемый при успешном создании скриншота.
  final void Function(PlaceMarkOption opts) onScreenShot;

  /// Начальные данные для отображения.
  final BubbleData bubbleData;

  const MarkerBubble({super.key, required this.bubbleDataStream, required this.onScreenShot, required this.bubbleData});

  @override
  State<MarkerBubble> createState() => _MarkerBubbleState();
}

/// Состояние для [MarkerBubble].
///
/// Подписывается на [bubbleDataStream], обновляет содержимое пузыря при изменении данных.
/// После обновления данных и завершения кадра вызывает создание скриншота виджета.
class _MarkerBubbleState extends State<MarkerBubble> {
  StreamSubscription<BubbleData>? _bubbleDataSubscription;

  late BubbleData bubbleData;

  @override
  void initState() {
    bubbleData = widget.bubbleData;
    _bubbleDataSubscription = widget.bubbleDataStream.listen((v) async {
      if (!mounted) return;

      if (bubbleData.distanceValue == v.distanceValue || v.distanceValue.isEmpty) return;
      setState(() {
        bubbleData.distanceValue = v.distanceValue;
        bubbleData.nameValue = v.nameValue;
        bubbleData.point = v.point;
        bubbleData.iconStyle = v.iconStyle;
        bubbleData.avatarUrl = v.avatarUrl;
      });
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        if (bubbleData.distanceValue.isNotEmpty || bubbleData.nameValue.isNotEmpty) {
          captureWidgetImage(MediaQuery(data: MediaQuery.of(context), child: widget), MediaQuery.devicePixelRatioOf(context)).then((data) {
            if (data == null) return;
            widget.onScreenShot(
              YandexPlacemarkMapObjectMemoryImage(data: MemoryImage(data), iconStyle: bubbleData.iconStyle, point: bubbleData.point),
            );
          });
        }
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    _bubbleDataSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(1000),
      color: Colors.white,
      clipBehavior: Clip.hardEdge,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(2),
            child: Material(
              color: Colors.transparent,
              clipBehavior: Clip.hardEdge,
              shape: CircleBorder(),
              child: Image.network(
                bubbleData.avatarUrl,
                width: 48,
                height: 48,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Assets.icons.executor.image(width: 48, height: 48, package: 'vox_ui_kit'),
                frameBuilder: (context, child, frame, wasSynchronouslyLoaded) => child,
              ),
            ),
          ),
          const SizedBox(width: 4),
          Padding(
            padding: const EdgeInsets.only(top: 8, right: 16, bottom: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                AppText(bubbleData.nameValue, type: AppTextType.w500s14, color: grayColors[950]),
                AppText(bubbleData.distanceValue, type: AppTextType.w400s12h16, color: grayColors[950]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Создаёт [MemoryImage] из переданного виджета [widget].
///
/// Использует функцию [captureWidgetImage] для получения изображения виджета.
/// [pixelRatio] — плотность пикселей для рендера (обычно равна devicePixelRatio).
///
/// Возвращает [MemoryImage] или null, если не удалось получить изображение.
Future<MemoryImage?> createMarker({required Widget widget, required double pixelRatio}) async {
  final uiImage = await captureWidgetImage(widget, pixelRatio);
  if (uiImage == null) return null;
  return MemoryImage(uiImage);
}

/// Делает скриншот переданного виджета [widget] с помощью [ScreenshotController].
///
/// [pixelRatio] — плотность пикселей для рендера.
/// [delay] — задержка перед созданием скриншота (по умолчанию 1 секунда, чтобы гарантировать загрузку изображений).
/// [targetSize] — размер итогового изображения (по умолчанию 150x70).
///
/// Возвращает [Uint8List] с PNG-изображением или null.
Future<Uint8List?> captureWidgetImage(Widget widget, double pixelRatio, {Duration delay = const Duration(milliseconds: 1000)}) async {
  final screenshotController = ScreenshotController();
  final image = await screenshotController.captureFromWidget(widget, pixelRatio: pixelRatio, delay: delay, targetSize: Size(150, 70));
  return image;
}

/// Класс для хранения данных пузыря маркера.
///
/// Содержит значения для имени, расстояния, точки на карте, стиля иконки и URL аватара.
base class BubbleData {
  /// Строка с расстоянием.
  String distanceValue = '';

  /// Имя объекта.
  String nameValue = '';

  /// Координаты на карте.
  mapkit.Point point;

  /// Стиль иконки для маркера.
  mapkit.IconStyle iconStyle;

  /// URL аватара.
  String avatarUrl;
  BubbleData({
    this.distanceValue = '',
    this.nameValue = '',
    this.point = const mapkit.Point(latitude: 59.94, longitude: 30.31),
    this.iconStyle = const mapkit.IconStyle(),
    this.avatarUrl = '',
  });
}
