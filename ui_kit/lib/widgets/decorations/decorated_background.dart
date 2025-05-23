import 'package:flutter/material.dart';

class DecoratedBackground extends StatelessWidget {
  const DecoratedBackground({
    required this.backgroundColor,
    required this.child,
    required this.linearGradienColors,
    this.alpha = 0.2,
    super.key,
    this.borderRadius = BorderRadius.zero,
  });
  final Widget? child;
  final double alpha;
  final Color backgroundColor;
  final BorderRadiusGeometry borderRadius;
  final List<Color> linearGradienColors;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: linearGradienColors),
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          boxShadow: [BoxShadow(color: backgroundColor, blurRadius: 10, spreadRadius: -4)],
        ),
        child: child,
      ),
    );
  }
}
