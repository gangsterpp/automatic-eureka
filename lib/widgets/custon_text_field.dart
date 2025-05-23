import 'package:flutter/material.dart';
import 'package:vox_ui_kit/theme/colors.dart';

class InsetShadowContainer extends StatelessWidget {
  final Widget child;
  final Color background;
  const InsetShadowContainer({
    super.key,
    required this.child,
    this.background = const Color(0xFFF1F2F4),
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      clipBehavior: Clip.hardEdge,
      borderRadius: BorderRadius.circular(12),
      elevation: 1,
      shadowColor: Colors.black.withOpacity(0.08),
      child: Ink(
        decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: const Alignment(0.0, 0),
            colors: [
              background.withOpacity(0.4),
              background,
              grayColors.shade100,
            ],
          ),
        ),
        child: ConstrainedBox(
          constraints: const BoxConstraints(minHeight: 44, maxHeight: 44),
          child: child,
        ),
      ),
    );
  }
}
