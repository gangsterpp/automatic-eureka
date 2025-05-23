import 'package:flutter/material.dart';

import 'colors.dart';

final primaryElevatedButtonTheme = ElevatedButtonThemeData(
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
);

///
final tertiaryElevatedButtonTheme = ElevatedButtonThemeData(
  style: ButtonStyle(
    backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
      if (states.contains(WidgetState.pressed)) {
        return grayColors[150]!.withValues(alpha: 0.1);
      }
      if (states.contains(WidgetState.disabled)) {
        return grayColors.shade50.withValues(alpha: 0.1);
      }
      return grayColors.shade100.withValues(alpha: 0.1);
    }),
    elevation: WidgetStateProperty.all(0),
    textStyle: WidgetStatePropertyAll(TextStyle(fontFamily: 'Lato', fontSize: 14, fontWeight: FontWeight.w600, height: 20 / 14)),
    foregroundColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.disabled)) {
        return grayColors.shade200;
      }
      return grayColors.shade900;
    }),
    shape: WidgetStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
    backgroundBuilder: (context, states, child) {
      return LayoutBuilder(
        builder: (_, c) {
          return CustomPaint(
            painter: _ShaderCustomPainter(
              color:
                  states.contains(WidgetState.pressed)
                      ? grayColors[150]!
                      : states.contains(WidgetState.disabled)
                      ? grayColors.shade50
                      : grayColors.shade100,
            ),
            size: c.biggest,
            child: child,
          );
        },
      );
    },
  ),
);

///
final secondaryElevatedButtonTheme = ElevatedButtonThemeData(
  style: ButtonStyle(
    backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
      if (states.contains(WidgetState.pressed)) {
        return primaryColors.shade200.withValues(alpha: 0.1);
      }
      if (states.contains(WidgetState.disabled)) {
        return primaryColors.shade100.withValues(alpha: 0.1);
      }
      return primaryColors.shade100.withValues(alpha: 0.1);
    }),
    elevation: WidgetStateProperty.all(0),
    textStyle: WidgetStatePropertyAll(TextStyle(fontFamily: 'Lato', fontSize: 14, fontWeight: FontWeight.w600, height: 20 / 14)),
    foregroundColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.disabled)) {
        return primaryColors.shade300;
      }
      return primaryColors.shade600;
    }),
    shape: WidgetStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
    backgroundBuilder: (context, states, child) {
      return LayoutBuilder(
        builder: (_, c) {
          return CustomPaint(
            painter: _ShaderCustomPainter(
              color:
                  states.contains(WidgetState.pressed)
                      ? primaryColors.shade200
                      : states.contains(WidgetState.disabled)
                      ? primaryColors.shade100
                      : primaryColors.shade100,
            ),
            size: c.biggest,
            child: child,
          );
        },
      );
    },
  ),
);

///
final warningElevatedButtonTheme = ElevatedButtonThemeData(
  style: ButtonStyle(
    backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
      if (states.contains(WidgetState.pressed)) {
        return otherRedLightColors.shade600.withValues(alpha: 0.1);
      }
      if (states.contains(WidgetState.disabled)) {
        return otherRedLightColors.shade400.withValues(alpha: 0.1);
      }
      return otherRedLightColors.shade500.withValues(alpha: 0.1);
    }),
    elevation: WidgetStateProperty.all(0),
    textStyle: WidgetStatePropertyAll(TextStyle(fontFamily: 'Lato', fontSize: 14, fontWeight: FontWeight.w600, height: 20 / 14)),
    foregroundColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.disabled)) {
        return grayColors.shade200;
      }
      return grayColors.shade900;
    }),
    shape: WidgetStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
    backgroundBuilder: (context, states, child) {
      return LayoutBuilder(
        builder: (_, c) {
          return CustomPaint(
            painter: _ShaderCustomPainter(
              color:
                  states.contains(WidgetState.pressed)
                      ? otherRedLightColors.shade600
                      : states.contains(WidgetState.disabled)
                      ? otherRedLightColors.shade400
                      : otherRedLightColors.shade500,
            ),
            size: c.biggest,
            child: child,
          );
        },
      );
    },
  ),
);

///
final whiteElevatedButtonTheme = ElevatedButtonThemeData(
  style: ButtonStyle(
    backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
      if (states.contains(WidgetState.pressed)) {
        return otherRedLightColors.shade600.withValues(alpha: 0.1);
      }
      if (states.contains(WidgetState.disabled)) {
        return otherRedLightColors.shade400.withValues(alpha: 0.1);
      }
      return otherRedLightColors.shade500.withValues(alpha: 0.1);
    }),
    elevation: WidgetStateProperty.all(0),
    textStyle: WidgetStatePropertyAll(TextStyle(fontFamily: 'Lato', fontSize: 14, fontWeight: FontWeight.w600, height: 20 / 14)),
    foregroundColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.disabled)) {
        return grayColors.shade200;
      }
      return grayColors.shade900;
    }),
    shape: WidgetStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
    backgroundBuilder: (context, states, child) {
      return LayoutBuilder(
        builder: (_, c) {
          return CustomPaint(
            painter: _ShaderCustomPainter(
              color:
                  states.contains(WidgetState.pressed)
                      ? otherRedLightColors.shade600
                      : states.contains(WidgetState.disabled)
                      ? otherRedLightColors.shade400
                      : otherRedLightColors.shade500,
            ),
            size: c.biggest,
            child: child,
          );
        },
      );
    },
  ),
);

///
final loginElevatedButtonTheme = ElevatedButtonThemeData(
  style: ButtonStyle(
    shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
    backgroundBuilder: (context, states, child) {
      return Ink(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: Colors.white.withValues(alpha: 0.4)),
            BoxShadow(
              color: states.contains(WidgetState.disabled) ? otherRedLightColors.shade400 : otherRedLightColors.shade500,
              blurRadius: 20,
              spreadRadius: -6,
            ),
          ],
        ),
        child: child,
      );
    },

    backgroundColor: WidgetStateProperty.resolveWith((state) {
      if (state.contains(WidgetState.disabled)) {
        return grayColors.shade100;
      }
      if (state.contains(WidgetState.pressed)) {
        return grayColors[150];
      }
      return grayColors.shade100;
    }),
    foregroundColor: WidgetStateProperty.resolveWith((state) {
      if (state.contains(WidgetState.disabled)) {
        return grayColors.shade200;
      }
      if (state.contains(WidgetState.pressed)) {
        return grayColors.shade900;
      }
      return grayColors.shade900;
    }),
    elevation: const WidgetStatePropertyAll(1),
    textStyle: WidgetStatePropertyAll(TextStyle(fontWeight: FontWeight.w600, fontSize: 14, height: 20 / 14)),
    padding: const WidgetStatePropertyAll(EdgeInsets.symmetric(vertical: 12)),
  ),
);

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
