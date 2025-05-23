import 'package:flutter/material.dart';
import 'package:vox_uikit/theme/app_colors.dart';

class AppSlider extends StatelessWidget {
  const AppSlider({
    required this.min,
    required this.max,
    required this.value,
    required this.onChanged,
    super.key,
  });

  /// Минимальное значение, которое может принимать ползунок.
  final double min;

  /// Максимальное значение, которое может принимать ползунок.
  final double max;

  /// Текущее значение ползунка.
  final double value;

  /// Коллбэк, вызываемый при изменении значения ползунка.
  /// Возвращает новое значение типа [double].
  final ValueChanged<double> onChanged;

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        trackHeight: 4,
        inactiveTrackColor: AppColors.grayScale50,
        activeTrackColor: Colors.transparent,
        overlayShape: SliderComponentShape.noOverlay,
        thumbShape: const _CustomThumbShape(),
        trackShape: const _GradientTrackShape(
          startColor: AppColors.secondary300,
          endColor: AppColors.secondary500,
          inactiveColor: AppColors.grayScale50,
        ),
      ),
      child: Slider(
        min: min,
        max: max,
        value: value,
        onChanged: onChanged,
      ),
    );
  }
}

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
class _GradientTrackShape extends SliderTrackShape {
  const _GradientTrackShape({
    required this.startColor,
    required this.endColor,
    required this.inactiveColor,
  });

  final Color startColor;
  final Color endColor;
  final Color inactiveColor;

  @override
  void paint(
    PaintingContext context,
    Offset offset, {
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required Animation<double> enableAnimation,
    required TextDirection textDirection,
    required Offset thumbCenter,
    Offset? secondaryOffset,
    bool isDiscrete = false,
    bool isEnabled = false,
  }) {
    final canvas = context.canvas;
    final trackHeight = sliderTheme.trackHeight ?? 4;
    final trackRadius = const Radius.circular(2);

    final trackLeft = offset.dx;
    final trackTop = thumbCenter.dy - trackHeight / 2;
    final trackWidth = parentBox.size.width;

    final fullTrack =
        Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
    final activeTrack = Rect.fromLTWH(
        trackLeft, trackTop, thumbCenter.dx - trackLeft, trackHeight);

    final inactivePaint = Paint()
      ..color = sliderTheme.inactiveTrackColor ?? inactiveColor
      ..style = PaintingStyle.fill;

    canvas.drawRRect(
      RRect.fromRectAndRadius(fullTrack, trackRadius),
      inactivePaint,
    );

    final gradientPaint = Paint()
      ..shader = LinearGradient(
        colors: [startColor, endColor],
      ).createShader(activeTrack)
      ..style = PaintingStyle.fill;

    canvas.drawRRect(
      RRect.fromRectAndRadius(activeTrack, trackRadius),
      gradientPaint,
    );
  }

  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final trackHeight = sliderTheme.trackHeight ?? 4;
    final trackLeft = offset.dx;
    final trackTop = offset.dy + (parentBox.size.height - trackHeight) / 2;
    final trackWidth = parentBox.size.width;

    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
class _CustomThumbShape extends SliderComponentShape {
  const _CustomThumbShape();

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) => const Size(20, 20);

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    final canvas = context.canvas;

    final thumbPaint = Paint()..color = Colors.white;

    // Тени (две)
    canvas.drawShadow(
      Path()
        ..addOval(Rect.fromCircle(center: center.translate(0, 2), radius: 12)),
      Colors.black.withAlpha(90),
      5,
      true,
    );

    canvas.drawShadow(
      Path()..addOval(Rect.fromCircle(center: center, radius: 12)),
      Colors.black.withAlpha(70),
      2,
      false,
    );

    // Нарисовать белый круг
    canvas.drawCircle(center, 10, thumbPaint);
  }
}
