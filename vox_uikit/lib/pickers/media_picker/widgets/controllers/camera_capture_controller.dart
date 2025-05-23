import 'package:camera/camera.dart';

class CameraCaptureController {
  CameraController? _controller;
  bool get isInitialized => _controller?.value.isInitialized == true;

  CameraController? get controller => _controller;

  Future<void> initialize() async {
    final cameras = await availableCameras();
    final backCamera =
        cameras.firstWhere((c) => c.lensDirection == CameraLensDirection.back);

    _controller = CameraController(
      backCamera,
      ResolutionPreset.max,
      enableAudio: true,
    );

    await _controller!.initialize();
  }

  Future<void> dispose() async {
    await _controller?.dispose();
    _controller = null;
  }
}
