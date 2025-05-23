import 'dart:async';

import 'package:VOX/features/walk/walk_modal_body.dart';
import 'package:VOX/providers/app_storage.dart';
import 'package:VOX/widgets/about_service_popup.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart' as geo;
import 'package:vox_ui_kit/vox_ui_kit.dart';
import 'package:vox_ui_kit/widgets/map/marker_bubble.dart';
import 'package:vox_ui_kit/widgets/map/place_mark_option.dart';
import 'package:vox_uikit/helpers/app_icons.dart';
import 'package:yandex_maps_mapkit/mapkit.dart' as mapkit;

class WalkBody extends ConsumerStatefulWidget {
  const WalkBody({super.key});

  @override
  ConsumerState<WalkBody> createState() => _WalkBodyState();
}

class _WalkBodyState extends ConsumerState<WalkBody> {
  final _currentPositionProgress = ValueNotifier(false);
  final _currentPosition = StreamController<CameraPosition>.broadcast();
  final _markerController =
      StreamController<({Marker marker, bool isAdd})>.broadcast();
  late final _showPopup = ValueNotifier(false);
  final bubbleDataStream = StreamController<BubbleData>.broadcast();

  static const _descriptions = [
    'Длительность выгула — 60 минут. Если требуется больше времени, то можно сообщить об этом оператору, и он все устроит!',
    'Каждый наш выгульщик — это ответственный, заботливый и опытный любитель собак, прошедший строгий отбор и обучение в нашей онлайн-академии.',
    'У каждого нашего выгульщика есть страховочная амуниция, которая минимизирует риск сбегания собаки.',
  ];

  YandexMapController? _controller;

  geo.Position? _position;

  bool inProc = false;
  ImageProvider? image;
  @override
  void initState() {
    super.initState();
    ref.read(appStorageProvider).fetchShowPopup().then((value) {
      _showPopup.value = value;
    });
  }

  @override
  void dispose() {
    _currentPosition.close();
    _markerController.close();
    _currentPositionProgress.dispose();
    _showPopup.dispose();
    super.dispose();
  }

  Future<void> _moveToCurrentLocation() async {
    const locationSettings = geo.LocationSettings(
      accuracy: geo.LocationAccuracy.high,
    );
    _position = await geo.Geolocator.getCurrentPosition(
      locationSettings: locationSettings,
    );
    _currentPosition.add(
      CameraPosition(
        position: _position!,
        zoom: 15.0,
        tilt: 30.0,
        azimuth: 0.0,
      ),
    );
  }

  void _onClosePopup() {
    ref.read(appStorageProvider).setShowPopup().whenComplete(() {
      _showPopup.value = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          children: [
            Opacity(
              opacity: 0,
              child: MarkerBubble(
                bubbleDataStream: bubbleDataStream.stream,
                onScreenShot: (data) {
                  _controller?.addPlacemark([data]);
                  _controller?.addPlacemark([
                    YandexPlacemarkMapPolylines(
                      points: [
                        const mapkit.Point(latitude: 59.94, longitude: 30.31),
                        mapkit.Point(
                          latitude: _position!.latitude,
                          longitude: _position!.longitude,
                        ),
                      ],
                      lineStyle: mapkit.LineStyle(
                        outlineColor: primaryColors.shade500,
                        dashLength: 100,
                        outlineWidth: 2.0,
                        strokeWidth: 5.0,
                      ),
                      strokeColor: primaryColors.shade500,
                    ),
                  ]);
                },
                bubbleData: BubbleData(distanceValue: '', nameValue: ''),
              ),
            ),
            SizedBox.expand(
              child: DefaultYandexMap(
                arrowPath: Assets.icons.circle.path,
                fillColor: primaryColors.shade600.withValues(alpha: 0.24),
                strokeColor: primaryColors.shade600,
                pinPath: Assets.icons.circle.path,
                onCameraMove: _currentPosition.stream,
                onControllerReady: (controller) {
                  _controller = controller;
                },
                onCameraProgress: (inProgress) {
                  _currentPositionProgress.value = inProgress;
                },
                markerStream: _markerController.stream,
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: SafeArea(
                minimum: const EdgeInsets.only(top: 8),
                child: LayoutBuilder(
                  builder: (_, constraints) {
                    return ValueListenableBuilder(
                      valueListenable: _showPopup,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16, top: 8),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.zero,
                          child: IntrinsicHeight(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: List.generate(_descriptions.length, (
                                index,
                              ) {
                                return Padding(
                                  padding: const EdgeInsets.only(right: 12),
                                  child: StatefulBuilder(
                                    builder: (c, state) {
                                      return ConstrainedBox(
                                        constraints: BoxConstraints(
                                          maxWidth: constraints.maxWidth * 0.89,
                                          minWidth: constraints.maxWidth * 0.89,

                                          minHeight: 94,
                                        ),
                                        child: AboutServicePopup(
                                          title: t.about_service_title,
                                          description: _descriptions[index],
                                          onClose:
                                              inProc
                                                  ? null
                                                  : () {
                                                    state(() => inProc = true);
                                                    _onClosePopup();
                                                  },
                                        ),
                                      );
                                    },
                                  ),
                                );
                              }),
                            ),
                          ),
                        ),
                      ),
                      builder: (context, value, child) {
                        return AnimatedCrossFade(
                          firstChild: const SizedBox.shrink(),
                          secondChild: child!,
                          crossFadeState:
                              value
                                  ? CrossFadeState.showSecond
                                  : CrossFadeState.showFirst,
                          duration: const Duration(milliseconds: 200),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,

                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: SizedBox(
                        width: 43,
                        height: 26,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: primaryColors.shade500,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(100),
                            ),
                          ),

                          child: Padding(
                            padding: const EdgeInsets.all(6),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              spacing: 2,
                              children: [
                                const Text(
                                  '0',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    height: 14 / 20,
                                    color: Colors.white,
                                  ),
                                ),
                                SvgPicture.asset(
                                  Assets.images.temp.paw,
                                  width: 14,
                                  height: 12,
                                  package: 'vox_ui_kit',
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 16,
                      left: 16,
                      top: 16,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      spacing: 16,
                      children: [
                        ListenableBuilder(
                          listenable: _currentPositionProgress,
                          builder: (_, _) {
                            return FloatingActionButton.small(
                              heroTag: 'back',
                              backgroundColor: whiteColors,
                              onPressed: context.pop,
                              child: const Icon(
                                AppIcons.arrowLeft,
                                color: Color(0xFF0C001A),
                              ),
                            );
                          },
                        ),
                        ListenableBuilder(
                          listenable: _currentPositionProgress,
                          builder: (_, _) {
                            return FloatingActionButton.small(
                              heroTag: 'move',
                              backgroundColor: whiteColors,
                              onPressed:
                                  _currentPositionProgress.value
                                      ? null
                                      : _moveToCurrentLocation,
                              child: Image.asset(
                                'assets/navigation.png',
                                width: 20,
                                height: 20,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),

                  WalkModalBody(
                    onMoveToCurrentLocation: _moveToCurrentLocation,
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
