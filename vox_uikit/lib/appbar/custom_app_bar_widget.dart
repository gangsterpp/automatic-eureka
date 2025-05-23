import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:vox_uikit/theme/app_colors.dart';
import 'package:vox_uikit/helpers/app_icons.dart';

class CustomAppBarAction {
  const CustomAppBarAction({
    required this.assetPath,
    required this.onPressed,
  });

  final IconData assetPath;
  final VoidCallback onPressed;
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.action,
  });

  final dynamic title;
  final CustomAppBarAction? action;

  @override
  Widget build(BuildContext context) {
    final bool canPop = Navigator.of(context).canPop();

    return AppBar(
      elevation: 12,
      shadowColor: AppColors.appBarShadowColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
      ),
      automaticallyImplyLeading: false,
      leading: canPop
          ? IconButton(
              icon: const Icon(AppIcons.arrowLeft),
              onPressed: () => Navigator.of(context).maybePop(),
            )
          : null,
      title: title is String
          ? Text(
              title,
              style: const TextStyle(
                color: AppColors.gray900,
                fontSize: 16,
                fontFamily: 'Lato',
                fontWeight: FontWeight.w500,
                height: 1.20,
              ),
            )
          : (title as Widget),
      actions: action != null
          ? [
              IconButton(
                icon: Icon(
                  action!.assetPath,
                  size: 24,
                  color: AppColors.gray900,
                ),
                onPressed: action!.onPressed,
              )
            ]
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
