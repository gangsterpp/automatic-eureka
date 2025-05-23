import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:vox_uikit/helpers/app_icons.dart';
import 'package:vox_uikit/theme/app_colors.dart';

class AppCircleAvatar extends StatelessWidget {
  const AppCircleAvatar({
    required this.imageUrl,
    required this.diameter,
    this.borderColor,
    super.key,
  });

  final String? imageUrl;
  final double diameter;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: diameter,
      height: diameter,
      imageUrl: imageUrl ?? 'none',
      imageBuilder: (context, imageProvider) => DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover, // Масштабируем изображение под круг
          ),
        ),
      ),
      placeholder: (context, url) => CircularProgressIndicator(
        strokeWidth: 1.0,
        valueColor: AlwaysStoppedAnimation<Color>(
          borderColor ?? Colors.transparent,
        ),
      ),
      errorWidget: (context, url, error) => SizedBox.square(
        dimension: diameter,
        child: DecoratedBox(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.gray100,
          ),
          child: Center(
            child: Icon(
              AppIcons.pawFilled,
              color: AppColors.white,
              size: diameter * 0.5,
            ),
          ),
        ),
      ),
    );
  }
}
