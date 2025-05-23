import 'package:VOX/widgets/custon_text_field.dart';
import 'package:flutter/material.dart';
import 'package:vox_ui_kit/vox_ui_kit.dart';

class CustomTextfield extends StatelessWidget {
  final String? title;
  final int? maxLines;
  final String? hintText;
  final TextEditingController? controller;
  final BoxConstraints constraints;
  final BoxConstraints childConstraints;
  final EdgeInsetsGeometry contentPadding;
  const CustomTextfield({
    super.key,
    this.title,
    this.maxLines,
    this.hintText,
    this.controller,
    this.constraints = const BoxConstraints(minHeight: 64, maxHeight: 64),
    this.childConstraints = const BoxConstraints(minHeight: 44, maxHeight: 44),
    this.contentPadding = const EdgeInsets.all(12),
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: constraints,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        spacing: 6,
        children: [
          if (title != null)
            Flexible(
              child: Text(
                title!,
                style: const TextStyle(
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  height: 14.4 / 12,
                  color: grayColors,
                ),
              ),
            ),
          ConstrainedBox(
            constraints: childConstraints,
            child: InsetShadowContainer(
              child: TextField(
                controller: controller,
                showCursor: false,
                maxLines: maxLines,
                scrollPadding: EdgeInsets.zero,
                style: const TextStyle(
                  fontFamily: 'Lato',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  height: 20 / 14,
                  color: Color(0xFF0B0C0E),
                ),
                decoration: InputDecoration(
                  hintStyle: const TextStyle(
                    fontFamily: 'Lato',
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    height: 20 / 14,
                    color: Color(0xFF81899C),
                  ),
                  hintMaxLines: 3,
                  hintText: hintText,
                  alignLabelWithHint: false,
                  fillColor: const Color(0xFFF1F2F4),
                  border: InputBorder.none,
                  contentPadding: contentPadding,
                  isDense: true,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
