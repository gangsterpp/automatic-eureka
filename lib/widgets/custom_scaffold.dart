import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({
    super.key,
    this.isDark = true,
    this.builder,
    this.leading,
    this.title,
  });
  final bool isDark;
  final WidgetBuilder? builder;
  final Widget? leading;
  final Widget? title;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: isDark ? SystemUiOverlayStyle.dark : SystemUiOverlayStyle.light,
      child: Scaffold(
        appBar: AppBar(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          shadowColor: Colors.black.withValues(alpha: 0.08),
          toolbarHeight:
              kToolbarHeight + 12 + MediaQuery.paddingOf(context).top,
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          elevation: 8,
          centerTitle: true,
          leading: Padding(
            padding: const EdgeInsets.only(left: 4),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 56, maxHeight: 48),
              child: Ink(
                child: InkWell(
                  onTap: () => context.pop(),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 16,
                      top: 12,
                      right: 12,
                      bottom: 12,
                    ),
                    child: Center(
                      child: Image.asset(
                        'assets/arrow-left.png',
                        width: 9,
                        height: 17,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          title: title,
        ),
        body: builder?.call(context) ?? const SizedBox.shrink(),
      ),
    );
  }
}
