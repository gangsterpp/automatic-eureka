part of '../app_media_file_picker.dart';

class _CameraCaptureScreen extends StatefulWidget {
  const _CameraCaptureScreen({
    required this.cameraController,
    required this.mode,
  });

  final CameraCaptureController cameraController;
  final _Mode mode;

  @override
  State<_CameraCaptureScreen> createState() => _CameraCaptureScreenState();
}

class _CameraCaptureScreenState extends State<_CameraCaptureScreen> {
  final ValueNotifier<bool> _showTimer = ValueNotifier(false);
  late final CameraController _controller;
  bool _isRecording = false;
  bool _isTakingPicture = false;
  Duration _recordDuration = Duration.zero;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _controller = widget.cameraController.controller!;
  }

  @override
  void dispose() {
    _timer?.cancel();
    _showTimer.dispose();
    super.dispose();
  }

  Future<void> _takePhoto() async {
    if (_isTakingPicture || _isRecording) return;
    setState(() => _isTakingPicture = true);

    try {
      final file = await _controller.takePicture();
      if (!mounted) return;
      _openPreviewScreen(File(file.path), fileType: AppMediaFileType.image);
    } catch (e) {
      // Обработка ошибки
    } finally {
      setState(() => _isTakingPicture = false);
    }
  }

  Future<void> _startVideoRecording() async {
    if (widget.mode == _Mode.singleImage) return;
    if (_isRecording || _isTakingPicture) return;
    try {
      final nativeOrientation = await NativeDeviceOrientationCommunicator()
          .orientation(useSensor: true);

      await _controller.lockCaptureOrientation(
        switch (nativeOrientation) {
          NativeDeviceOrientation.portraitUp => DeviceOrientation.portraitUp,
          NativeDeviceOrientation.portraitDown =>
            DeviceOrientation.portraitDown,
          NativeDeviceOrientation.landscapeLeft =>
            DeviceOrientation.landscapeLeft,
          NativeDeviceOrientation.landscapeRight =>
            DeviceOrientation.landscapeRight,
          _ => DeviceOrientation.portraitUp,
        },
      );
      await _controller.startVideoRecording();
      _recordDuration = Duration.zero;
      _showTimer.value = true;
      _timer = Timer.periodic(const Duration(seconds: 1), (_) {
        setState(() {
          _recordDuration += const Duration(seconds: 1);
        });
      });
      setState(() => _isRecording = true);
    } catch (e) {
      // Ошибка начала записи
    }
  }

  Future<void> _stopVideoRecording() async {
    if (widget.mode == _Mode.singleImage) return;
    if (!_isRecording) return;
    _timer?.cancel();
    _showTimer.value = false;
    setState(() => _isRecording = false);

    try {
      final file = await _controller.stopVideoRecording();
      await _controller.unlockCaptureOrientation();

      if (!mounted) return;
      _openPreviewScreen(File(file.path), fileType: AppMediaFileType.video);
    } catch (e) {
      // Ошибка остановки записи
    }
  }

  void _openPreviewScreen(
    File file, {
    required AppMediaFileType fileType,
  }) async {
    final result = await Navigator.of(context).push<AppMediaFile?>(
      MaterialPageRoute(
        builder: (_) => _MediaPreviewScreen(
          file: file,
          fileType: fileType,
          duration: switch (fileType) {
            AppMediaFileType.image => null,
            AppMediaFileType.video => _recordDuration,
          },
        ),
      ),
    );

    if (result == null || !mounted) return;
    Navigator.pop(context, result);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final deviceRatio = size.height / size.width;
    final cameraRatio = _controller.value.aspectRatio;

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: OverflowBox(
              maxHeight: cameraRatio > deviceRatio
                  ? size.width * cameraRatio
                  : size.height,
              maxWidth: cameraRatio > deviceRatio
                  ? size.width
                  : size.height / cameraRatio,
              child: CameraPreview(_controller),
            ),
          ),
          ValueListenableBuilder<bool>(
            valueListenable: _showTimer,
            builder: (_, show, __) {
              return !show
                  ? const SizedBox()
                  : Positioned(
                      top: 50,
                      left: 20,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black.withAlpha(60),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          _formatDuration(_recordDuration),
                          style: AppTextStyles.s14h20w600$ButtonM.copyWith(
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    );
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 32),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 12,
                children: [
                  GestureDetector(
                    onTap: _takePhoto,
                    onLongPress: _startVideoRecording,
                    onLongPressUp: _stopVideoRecording,
                    child: FloatingActionButton.large(
                      heroTag: null,
                      shape: const CircleBorder(),
                      onPressed: null,
                      backgroundColor: _isRecording ? Colors.red : Colors.white,
                    ),
                  ),
                  if (widget.mode == _Mode.multipleMedia)
                    Text(
                      'Нажмите для фото, удерживайте для видео',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.s14h20w600$ButtonM.copyWith(
                        color: AppColors.white,
                      ),
                    )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _formatDuration(Duration duration) {
    final minutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }
}

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
class _MediaPreviewScreen extends StatelessWidget {
  const _MediaPreviewScreen({
    required this.file,
    required this.fileType,
    required this.duration,
  });

  final File file;
  final AppMediaFileType fileType;
  final Duration? duration;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Center(
            child: switch (fileType) {
              AppMediaFileType.video => _VideoPlayerWidget(file: file),
              AppMediaFileType.image => InteractiveViewer(
                  child: Image.file(file),
                ),
            },
          ),
          Positioned(
            bottom: 40,
            left: 40,
            right: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () => _onCancelTapped(context),
                  child: const Text('Назад'),
                ),
                ElevatedButton(
                  onPressed: () => _onOkTapped(context),
                  child: const Text('Ок'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _onCancelTapped(BuildContext context) {
    Navigator.pop(context);
  }

  Future<void> _onOkTapped(BuildContext context) async {
    final mediaFile = await _createAppMediaFile(file: file, fileType: fileType);
    if (!context.mounted) return;
    Navigator.pop(context, mediaFile);
  }

  Future<AppMediaFile> _createAppMediaFile({
    required File file,
    required AppMediaFileType fileType,
  }) async {
    final String name = file.path.split(Platform.pathSeparator).last;
    final int sizeInBytes = await file.length();
    final String fileSize = _formatBytes(sizeInBytes);

    Uint8List? cover;

    if (fileType == AppMediaFileType.image) {
      cover = await file.readAsBytes(); // Для фото просто читаем как байты
    } else if (fileType == AppMediaFileType.video) {
      cover = await _getVideoThumbnail(file.path); // Извлекаем кадр
    }

    return AppMediaFile(
      fileType: fileType,
      cover: cover,
      name: name,
      fileSize: fileSize,
      file: file,
      duration: duration,
    );
  }

  String _formatBytes(int bytes, [int decimals = 2]) {
    if (bytes == 0) return "0 B";
    const suffixes = ["B", "KB", "MB", "GB"];
    final i = (bytes != 0) ? (log(bytes) / log(1024)).floor() : 0;
    return "${(bytes / pow(1024, i)).toStringAsFixed(decimals)} ${suffixes[i]}";
  }

  Future<Uint8List?> _getVideoThumbnail(String videoPath) async {
    return await VideoThumbnail.thumbnailData(
      video: videoPath,
      maxWidth: 128,
      quality: 75,
    );
  }
}

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
class _VideoPlayerWidget extends StatefulWidget {
  const _VideoPlayerWidget({required this.file});

  final File file;

  @override
  State<_VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<_VideoPlayerWidget> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.file(widget.file)
      ..initialize().then((_) => setState(() {}));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _togglePlayPause() {
    setState(() {
      if (_controller.value.isPlaying) {
        _controller.pause();
      } else {
        _controller.play();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _togglePlayPause,
      child: _controller.value.isInitialized
          ? AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            )
          : const CircularProgressIndicator(),
    );
  }
}
