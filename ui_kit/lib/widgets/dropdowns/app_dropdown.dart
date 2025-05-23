import 'package:flutter/material.dart';

import '../../theme/app_text.dart';

class AppDropdown extends StatelessWidget {
  final String? labelText;
  final VoidCallback? onTap;
  final TextEditingController? controller;
  final LinearGradient? linearGradient;
  final List<BoxShadow>? boxShadow;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry innerPadding;
  const AppDropdown({
    super.key,
    this.labelText,
    this.onTap,
    this.controller,
    this.innerPadding = const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
    this.borderRadius = const BorderRadius.all(Radius.circular(12)),
    this.linearGradient = const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [Colors.white, Color(0xFFF1F2F4)],
    ),
    this.boxShadow = const [BoxShadow(color: Color(0xFFF1F2F4), blurRadius: 10, spreadRadius: -4)],
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (labelText != null) ...[AppText(labelText!, type: AppTextType.w400s12h14), const SizedBox(height: 6)],
        Material(
          borderRadius: borderRadius,
          color: Colors.transparent,
          child: InkWell(
            borderRadius: borderRadius,
            onTap: onTap,
            child: Ink(
              decoration: BoxDecoration(borderRadius: borderRadius, gradient: linearGradient, boxShadow: boxShadow),
              child: Padding(
                padding: innerPadding,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ListenableBuilder(
                      listenable: Listenable.merge([controller]),
                      builder: (_, _) => AppText(controller?.text ?? '-', type: AppTextType.w400s14h20),
                    ),
                    const Icon(Icons.arrow_drop_down, color: Color(0xFF81899C), size: 24),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
