import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leading;
  final Widget? title;
  const CustomAppBar({super.key, this.leading, this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shadowColor: Colors.black.withValues(alpha: 0.08),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      elevation: 8,
      centerTitle: true,
      leading: leading,
      title: title,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
