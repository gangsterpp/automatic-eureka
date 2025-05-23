import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../theme/colors.dart';

class AppScaffold extends StatelessWidget {
  final Widget? title;
  final WidgetBuilder? builder;
  final Widget? leading;
  final bool isDark;
  const AppScaffold({super.key, this.title, required this.builder, this.leading, this.isDark = false});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: isDark ? SystemUiOverlayStyle.dark : SystemUiOverlayStyle.light,
      child: Scaffold(
        appBar: AppBar(
          leading: leading,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
          ),
          backgroundColor: whiteColors.shade900,
          shadowColor: Colors.black.withValues(alpha: 0.08),
          surfaceTintColor: whiteColors.shade900,
          elevation: 4,
          title: title,
          centerTitle: true,
        ),
        body: builder?.call(context) ?? const SizedBox.shrink(),
      ),
    );
  }
}
