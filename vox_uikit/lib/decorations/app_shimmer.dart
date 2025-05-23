import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:vox_uikit/theme/app_colors.dart';

class AppShimmer extends StatelessWidget {
  const AppShimmer.rectangle({
    super.key,
    this.height = 16,
    this.width,
    this.borderRadius,
  })  : diameter = null,
        isCircle = false;

  const AppShimmer.circle({
    super.key,
    this.diameter = 16,
  })  : height = null,
        width = null,
        borderRadius = null,
        isCircle = true;

  final double? width;
  final double? height;
  final double? diameter;
  final double? borderRadius;
  final bool isCircle;

  @override
  Widget build(BuildContext context) {
    final Widget child;

    if (isCircle) {
      child = SizedBox.square(
        dimension: diameter,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            shape: BoxShape.circle,
          ),
        ),
      );
    } else {
      child = SizedBox(
        width: width ?? double.maxFinite,
        height: height,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.all(
              Radius.circular(borderRadius ?? ((height ?? 1) * 0.15)),
            ),
          ),
        ),
      );
    }

    return Shimmer.fromColors(
      baseColor: AppColors.primary100,
      highlightColor: AppColors.gray50,
      child: child,
    );
  }
}
