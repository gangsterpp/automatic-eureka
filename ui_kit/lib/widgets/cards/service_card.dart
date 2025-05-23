import 'package:flutter/material.dart';

abstract class ServiceCard extends StatelessWidget {
  final Widget text;
  final Color color;
  final Widget Function(BuildContext contex, double scaleHeight, double scaleWidth, double width)? textWithBorder;
  Widget image(BuildContext contex, double scaleHeight, double scaleWidth, double width, double height);
  final VoidCallback? onTap;
  double get widthCoeff => 13.83;

  const ServiceCard({super.key, required this.text, required this.color, this.textWithBorder, this.onTap});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final size = MediaQuery.of(context).size;
        double scaleWidth = 0;
        double scaleHeight = 0;
        AlignmentGeometry begin;
        if (width < 600) {
          scaleWidth = width / 343;
          scaleHeight = size.height / 1044;
          begin = const Alignment(0, -1.6);
        } else {
          scaleWidth = size.height / 343;
          scaleHeight = width / 1044;
          begin = Alignment.topCenter;
        }

        return DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: color,

            gradient: LinearGradient(colors: [Colors.white, color], begin: begin, end: Alignment.bottomCenter),
          ),

          child: ClipRRect(
            clipBehavior: Clip.hardEdge,
            borderRadius: BorderRadius.circular(12),
            child: InkWell(
              onTap: onTap,
              child: SizedBox(
                width: width,
                height: constraints.maxHeight,
                child: Stack(
                  children: [
                    image(context, scaleHeight, scaleWidth, width, constraints.maxHeight),
                    if (textWithBorder != null) textWithBorder!(context, scaleHeight, scaleWidth, width),
                    Positioned(top: width / widthCoeff, left: width / widthCoeff, child: text),
                    Positioned.fill(
                      child: CustomPaint(
                        painter: _InnerShadowPainter(
                          shadowColor: Colors.black.withValues(alpha: .08),
                          blur: 203 * scaleHeight / 20,
                          offset: Offset(0, -(203 * scaleHeight) / 1.5),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _InnerShadowPainter extends CustomPainter {
  final Color shadowColor;
  final double blur;
  final Offset offset;
  final BorderRadius borderRadius;

  _InnerShadowPainter({required this.shadowColor, required this.blur, required this.offset, required this.borderRadius});

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final rrect = borderRadius.toRRect(rect);

    final path = Path()..addRRect(rrect);

    final paint =
        Paint()
          ..color = shadowColor
          ..maskFilter = MaskFilter.blur(BlurStyle.normal, blur);

    canvas.save();

    canvas.clipPath(path);

    canvas.translate(-offset.dx, -offset.dy);
    canvas.drawPath(path, paint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant _InnerShadowPainter old) =>
      old.shadowColor != shadowColor || old.blur != blur || old.offset != offset || old.borderRadius != borderRadius;
}
