import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:native_device_orientation/native_device_orientation.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:video_player/video_player.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
import 'package:vox_uikit/main.dart';
import 'package:vox_uikit/pickers/media_picker/widgets/controllers/camera_capture_controller.dart';
import 'package:vox_uikit/select_controls/app_checkbox.dart';

part 'models/app_media_file.dart';

part 'models/app_media_file_type.dart';

part 'widgets/camera_capture_screen.dart';

part 'widgets/camera_tile.dart';

part 'widgets/media_tile.dart';

part 'widgets/top_panel.dart';

part 'widgets/bottom_panel.dart';

/// Режим работы пикера
enum _Mode {
  /// Выбор одного изображения
  singleImage,

  /// Множественный выбор изображений и/или видео
  multipleMedia,
}

class AppMediaFilePicker extends StatefulWidget {
  const AppMediaFilePicker._(this._mode);

  final _Mode _mode;

  static const int filesPageSize = 30;

  @override
  State<AppMediaFilePicker> createState() => _AppMediaFilePickerState();

  static Future<AppMediaFile?> singleImage(BuildContext context) =>
      _show<AppMediaFile?>(context, _Mode.singleImage);

  static Future<List<AppMediaFile>?> multipleMedia(BuildContext context) =>
      _show<List<AppMediaFile>?>(context, _Mode.multipleMedia);

  static Future<T?> _show<T>(BuildContext context, _Mode mode) =>
      showModalBottomSheet<T>(
        useRootNavigator: true,
        useSafeArea: true,
        isScrollControlled: true,
        constraints: const BoxConstraints(
          maxWidth: double.maxFinite,
        ),
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) => AppMediaFilePicker._(mode),
      );
}

class _AppMediaFilePickerState extends State<AppMediaFilePicker>
    with WidgetsBindingObserver {
  final _cameraController = CameraCaptureController();
  final List<AssetEntity> _selectedEntities = [];
  bool _canRequestNextPage = true;

  bool _isCameraGranted = false;
  bool _isCataloguesGranted = false;

  bool _isEntitiesNotFound = false;
  final List<Widget> _previews = [];
  final List<AssetEntity> _entities = [];
  int currentPage = 0;
  late int lastPage;

  final List<AssetPathEntity> _albums = [];
  AssetPathEntity? _selectedAlbum;

  // если FALSE, то не выполняется проверка нахождения приложения в фоновом
  // режиме в момент отображения нативного запроса на предоставление прав
  bool disableInactiveAppControl = false;

  // ---------------------------------------------------------------------------
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _initializeAfterPermissions();
  }

  // ---------------------------------------------------------------------------
  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _cameraController.dispose();
    super.dispose();
  }

  // ---------------------------------------------------------------------------
  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed && !disableInactiveAppControl) {
      await Future.delayed(const Duration(milliseconds: 300));
      await _initializeAfterPermissions();
    }
  }

  // ---------------------------------------------------------------------------
  Future<void> _initializeAfterPermissions() async {
    disableInactiveAppControl = true;
    await _ensureAllPermissions();
    if (_isCameraGranted) await _cameraController.initialize();
    if (_isCataloguesGranted) await _fetchNewMedia();
    disableInactiveAppControl = false;
    if (mounted) setState(() {});
  }

  /// Проверяет разрешения, получает из галереи набор сущностей, парсит
  /// превью на виджеты и перестраивает UI
  Future<void> _fetchNewMedia() async {
    final requestType = switch (widget._mode) {
      _Mode.singleImage => RequestType.image,
      _Mode.multipleMedia => RequestType.common,
    };

    final permission = await PhotoManager.getPermissionState(
      requestOption: const PermissionRequestOption(),
    );

    if (permission == PermissionState.denied ||
        permission == PermissionState.notDetermined ||
        permission == PermissionState.restricted) {
      return;
    }

    if (permission == PermissionState.limited) {
      await PhotoManager.presentLimited(type: requestType);
      unawaited(_fetchGrantedMedia());
    } else if (permission == PermissionState.authorized) {
      unawaited(_fetchGrantedMedia());
    }
  }

  // ---------------------------------------------------------------------------
  /// Запрашивает все необходимые разрешения и возвращает флаг успеха
  Future<void> _ensureAllPermissions() async {
    final galleryPermission = await PhotoManager.requestPermissionExtend();
    final cameraPermission = await Permission.camera.request();

    if (mounted) {
      setState(() {
        _isCataloguesGranted = galleryPermission.isAuth == true;
        _isCameraGranted = cameraPermission.isGranted;
      });
    }
  }

  // ---------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.85,
      minChildSize: 0.3,
      maxChildSize: 0.85,
      builder: (_, controller) => DecoratedBox(
        decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(26),
            topRight: Radius.circular(26),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // -----------------------------------------------------------------
            /// Верхняя панель с селектором альбомов и крестиком
            _TopPickerPanel(
              albums: _albums,
              selectedAlbum: _selectedAlbum,
              onAlbumSelected: _onAlbumSelected,
            ),

            // -----------------------------------------------------------------
            /// КОНТЕНТ ПИККЕРА:
            Expanded(
              child: NotificationListener<ScrollNotification>(
                onNotification: _onNextPageRequested,
                child: CustomScrollView(
                  controller: controller,
                  slivers: [
                    SliverPadding(
                      padding: const EdgeInsets.only(top: 1),
                      sliver: SliverGrid(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                        ),
                        delegate: SliverChildBuilderDelegate(
                          childCount: _previews.length + 1,
                          (context, index) {
                            /// Плитка камеры
                            if (index == 0) {
                              return _CameraTile(
                                isGranted: _isCameraGranted,
                                cameraController: _cameraController,
                                mode: widget._mode,
                              );
                            }

                            /// Сетка файлов в каталоге
                            return _MediaTile(
                              onItemSelected: (item) =>
                                  _onItemTapped(context, item),
                              previews: _previews,
                              entities: _entities,
                              selectedEntities: _selectedEntities,
                              mode: widget._mode,
                              index: index - 1,
                            );
                          },
                        ),
                      ),
                    ),

                    /// Если каталог оказался пустым
                    if (_isEntitiesNotFound)
                      const SliverPadding(
                        padding: EdgeInsets.only(top: 76),
                        sliver: SliverToBoxAdapter(
                          child: _EmptyCatalogue(),
                        ),
                      ),

                    /// Если пользователь запретил работать с каталогом
                    if (!_isCataloguesGranted)
                      const SliverPadding(
                        padding: EdgeInsets.only(top: 76),
                        sliver: SliverToBoxAdapter(
                          child: _PermissionDeniedContent(),
                        ),
                      ),
                  ],
                ),
              ),
            ),

            // -----------------------------------------------------------------
            /// Кнопка "Готово"
            if (widget._mode == _Mode.multipleMedia)
              _BottomPickerButton(
                selectedEntitiesCount: _selectedEntities.length,
                onTapped: () => _onReadyTapped(context),
              ),

            // -----------------------------------------------------------------
            /// Маржин снизу (для айфонов)
            if (Platform.isIOS)
              SizedBox(
                width: double.maxFinite,
                height: MediaQuery.of(context).viewPadding.bottom,
                child: const ColoredBox(color: AppColors.white),
              ),
          ],
        ),
      ),
    );
  }

  /// Вызывает загрузку следующей порции файлов
  bool _onNextPageRequested(ScrollNotification scroll) {
    if (scroll.metrics.pixels / scroll.metrics.maxScrollExtent > 0.33) {
      if (currentPage != lastPage) {
        _fetchGrantedMedia();
      }
    }
    return false;
  }

  // ---------------------------------------------------------------------------
  /// получает из галереи разрешенный набор сущностей,
  /// парсит превью на виджеты и перестраивает UI
  Future<void> _fetchGrantedMedia() async {
    if (!_canRequestNextPage) return;

    lastPage = currentPage;

    final requestType = switch (widget._mode) {
      _Mode.singleImage => RequestType.image,
      _Mode.multipleMedia => RequestType.common,
    };

    // Получаем альбомы, если ещё не загружены
    if (_albums.isEmpty) {
      final albums = await PhotoManager.getAssetPathList(
        type: requestType,
        filterOption: FilterOptionGroup(
          orders: [
            const OrderOption(type: OrderOptionType.createDate, asc: false)
          ],
        ),
      );
      setState(() {
        _albums.addAll(albums);
        _selectedAlbum = _albums.firstOrNull;
      });
    }

    final album = _selectedAlbum;
    if (album == null) return;

    final entities = await album.getAssetListPaged(
      page: currentPage,
      size: AppMediaFilePicker.filesPageSize,
    );

    if (entities.isEmpty) {
      setState(() => _isEntitiesNotFound = true);
      return;
    }

    _canRequestNextPage = entities.length == AppMediaFilePicker.filesPageSize;
    _entities.addAll(entities);
    _previews.addAll(await _buildPreviewWidgets(entities));

    setState(() {
      currentPage++;
    });
  }

  // ---------------------------------------------------------------------------
  /// Создает список превью для карточек медиа-файлов
  Future<List<Widget>> _buildPreviewWidgets(List<AssetEntity> entities) async {
    final List<Widget> previews = [];

    for (final entity in entities) {
      final thumbData = await _getThumbDataOrNull(entity);
      if (thumbData == null) continue;

      previews.add(
        Stack(
          children: [
            Positioned.fill(
              child: Image.memory(
                thumbData,
                fit: BoxFit.cover,
              ),
            ),
            if (entity.type == AssetType.video)
              Positioned(
                right: 12,
                bottom: 12,
                child: DecoratedBox(
                  decoration: const BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 3,
                    ),
                    child: Text(
                      _getTime(entity.videoDuration),
                      style: AppTextStyles.s12h16w400$Label.copyWith(
                        color: AppColors.gray100,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      );
    }

    return previews;
  }

  /// Конвертирует Duration в вид "мм:cc"
  String _getTime(Duration videoDuration) {
    final dummyDate = DateTime(1990).add(videoDuration);
    return DateFormat.ms().format(dummyDate);
  }

  /// Возвращает размер файла формате "123,12 GB"
  Future<String?> _getFileSize(File? file, {int decimals = 0}) async {
    if (file == null) return null;
    final bytes = await file.length();

    if (bytes <= 0) return '0 B';
    const suffixes = ['B', 'KB', 'MB', 'GB'];
    final i = (log(bytes) / log(1024)).floor();
    return '${(bytes / pow(1024, i)).toStringAsFixed(decimals)} ${suffixes[i]}';
  }

  Future<void> _onItemTapped(BuildContext context, AssetEntity item) async {
    switch (widget._mode) {
      case _Mode.singleImage:
        Navigator.pop(context, item);
      case _Mode.multipleMedia:
        _updateSelectedEntities(item);
    }
  }

  /// Обновляет список выбранных элементов
  void _updateSelectedEntities(AssetEntity item) {
    setState(() {
      _selectedEntities.contains(item)
          ? _selectedEntities.remove(item)
          : _selectedEntities.add(item);
    });
  }

  /// Пользователь нажал кнопку "Готово"
  Future<void> _onReadyTapped(BuildContext context) async {
    final selectedFiles = await _mapEntitiesInChunks(_selectedEntities);
    if (!context.mounted) return;
    Navigator.pop(context, selectedFiles);
  }

  /// Мапит сущности пакета photo_manager на бизнес-модели с ограничением количества параллельных задач
  Future<List<AppMediaFile>> _mapEntitiesInChunks(
    List<AssetEntity> entities, {
    int chunkSize = 10,
  }) async {
    final List<AppMediaFile> result = [];
    for (var i = 0; i < entities.length; i += chunkSize) {
      final chunk = entities.skip(i).take(chunkSize);
      final chunkResults = await Future.wait(chunk.map(_mapEntityToMediaFile));
      result.addAll(chunkResults);
    }
    return result;
  }

  /// Мапит одну сущность из пакета photo_manager на одну бизнес-модель AppMediaFile
  Future<AppMediaFile> _mapEntityToMediaFile(AssetEntity selectedEntity) async {
    final type = switch (selectedEntity.type) {
      AssetType.image => AppMediaFileType.image,
      AssetType.video => AppMediaFileType.video,
      _ => throw UnsupportedError(
          'Not supported file type ${selectedEntity.type}'),
    };
    final file = await selectedEntity.file;
    final cover = await selectedEntity.thumbnailDataWithSize(
      const ThumbnailSize.square(160),
    );
    final duration = switch (type) {
      AppMediaFileType.image => null,
      AppMediaFileType.video => selectedEntity.videoDuration,
    };
    final fileSize = await _getFileSize(file);
    final fileName = await _getFileName(selectedEntity);

    return AppMediaFile(
      fileType: type,
      cover: cover,
      name: fileName,
      file: file,
      fileSize: fileSize,
      duration: duration,
    );
  }

  /// Возвращает имя файла
  Future<String> _getFileName(AssetEntity entity) async {
    if (entity.title?.isNotEmpty == true) {
      return entity.title ?? '';
    } else {
      // если iOS отдал пустую строку в [entity.title], берём название файла из его пути
      final originFile = await entity.originFileWithSubtype;
      return (originFile?.path ?? '').split(Platform.pathSeparator).last;
    }
  }

  /// Устанавливает новый каталог, если пользователь выбрал другой каталог
  Future<void> _onAlbumSelected(AssetPathEntity selected) async {
    if (selected == _selectedAlbum) return;
    _canRequestNextPage = true;
    setState(() {
      _selectedAlbum = selected;
      _entities.clear();
      _previews.clear();
      currentPage = 0;
    });
    await _fetchGrantedMedia();
  }

  /// Возвращает данные для тайла
  Future<Uint8List?> _getThumbDataOrNull(AssetEntity entity) async {
    const thumbSize = ThumbnailSize(200, 200);
    try {
      final thumbData = await entity.thumbnailDataWithSize(thumbSize);
      return thumbData;
    } on Object {
      return null;
    }
  }
}

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
class _PermissionDeniedContent extends StatelessWidget {
  const _PermissionDeniedContent();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            'Доступ запрещен',
            textAlign: TextAlign.center,
            style: AppTextStyles.s14h16w400$BodyS.copyWith(
              color: AppColors.gray400,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: AppAccentButton.tertiary(
            text: 'В настройки приложений',
            onTapped: _onAppSettingsTapped,
          ),
        )
      ],
    );
  }

  // ---------------------------------------------------------------------------
  /// Переход в настройки
  Future<void> _onAppSettingsTapped() async {
    await PhotoManager.openSetting();
  }
}

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
class _EmptyCatalogue extends StatelessWidget {
  const _EmptyCatalogue();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Нет файлов для выбора',
        textAlign: TextAlign.center,
        style: AppTextStyles.s14h16w400$BodyS.copyWith(
          color: AppColors.gray400,
        ),
      ),
    );
  }
}
