part of '../app_media_file_picker.dart';

const _cameraHeroTag = 'camera-tile-hero';

class _CameraTile extends StatefulWidget {
  const _CameraTile({
    required this.cameraController,
    required this.isGranted,
    required this.mode,
  });

  final _Mode mode;
  final bool isGranted;
  final CameraCaptureController cameraController;

  @override
  State<_CameraTile> createState() => _CameraTileState();
}

class _CameraTileState extends State<_CameraTile> {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: _cameraHeroTag,
      child: Padding(
        padding: const EdgeInsets.all(0.5),
        child: !widget.isGranted
            ? Stack(
                alignment: Alignment.center,
                children: [
                  /// Заливка
                  const Positioned.fill(
                    child: ColoredBox(color: AppColors.gray200),
                  ),

                  /// Заливка
                  Positioned.fill(
                    child: Text(
                      'Перейдите в настройки и разрешите использование камеры',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.s14h16w400$BodyS.copyWith(
                        color: AppColors.gray400,
                      ),
                    ),
                  ),

                  /// Нажималка
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: _onAppSettingsTapped,
                      overlayColor: WidgetStateProperty.all(
                        AppColors.primary300.withAlpha(30),
                      ),
                    ),
                  ),
                ],
              )
            : Stack(
                alignment: Alignment.center,
                children: [
                  /// Превью камеры
                  if (widget.cameraController.isInitialized)
                    Positioned.fill(
                      child: CameraPreview(
                        widget.cameraController.controller!,
                      ),
                    ),

                  /// Вуаль
                  Positioned.fill(
                    child: ColoredBox(color: AppColors.gray400.withAlpha(50)),
                  ),

                  /// Иконка камеры
                  const Positioned(
                    right: 12,
                    top: 12,
                    child: Icon(
                      AppIcons.cameraStroke,
                      size: 40,
                      color: AppColors.gray50,
                    ),
                  ),

                  /// Нажималка
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () => _onCameraTapped(context),
                      overlayColor: WidgetStateProperty.all(
                        AppColors.primary300.withAlpha(30),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  // ---------------------------------------------------------------------------
  /// Переход в настройки
  Future<void> _onAppSettingsTapped() async {
    await PhotoManager.openSetting();
  }

  /// Действие при нажатии на иконку камеры
  Future<void> _onCameraTapped(BuildContext context) async {
    final file = await Navigator.of(context).push<AppMediaFile?>(
      MaterialPageRoute(
        builder: (_) => _CameraCaptureScreen(
          cameraController: widget.cameraController,
          mode: widget.mode,
        ),
      ),
    );
    if (!context.mounted || file == null) return;
    setState(() {});
    switch (widget.mode) {
      case _Mode.singleImage:
        Navigator.pop(context, file);
      case _Mode.multipleMedia:
        Navigator.pop(context, [file]);
    }
  }
}
