import 'package:flutter/material.dart';

import '../theme/colors.dart';

class ElevatedAppButton extends StatelessWidget {
  final Widget? child;
  final VoidCallback? onPressed;
  const ElevatedAppButton({required this.child, required this.onPressed, super.key});

  factory ElevatedAppButton.loader() {
    return ElevatedAppButton(onPressed: null, child: Center(child: CircularProgressIndicator.adaptive()));
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.pressed)) {
            return primaryColors.shade600.withValues(alpha: 0.1);
          }
          if (states.contains(WidgetState.disabled)) {
            return primaryColors.shade300.withValues(alpha: 0.1);
          }
          return primaryColors.shade500.withValues(alpha: 0.1);
        }),
        elevation: WidgetStateProperty.all(0),
        textStyle: WidgetStatePropertyAll(TextStyle(fontFamily: 'Lato', fontSize: 14, fontWeight: FontWeight.w600, height: 20 / 14)),
        foregroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return primaryColors.shade100;
          }
          return whiteColors;
        }),
        shape: WidgetStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
        backgroundBuilder: (context, states, child) {
          return LayoutBuilder(
            builder: (_, c) {
              return CustomPaint(
                painter: _ShaderCustomPainter(
                  color:
                      states.contains(WidgetState.pressed)
                          ? primaryColors.shade600
                          : states.contains(WidgetState.disabled)
                          ? primaryColors.shade300
                          : primaryColors.shade500,
                ),
                size: c.biggest,
                child: child,
              );
            },
          );
        },
      ),
      child: child,
    );
  }
}

class _ShaderCustomPainter extends CustomPainter {
  final Color color;
  _ShaderCustomPainter({required this.color});
  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = color
          ..style = PaintingStyle.fill
          ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 10);
    canvas.drawRect(Rect.fromLTWH(-10, 0, size.width + 20, size.height + 10), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
