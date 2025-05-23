import 'package:flutter/material.dart';
import 'package:vox_uikit/theme/app_colors.dart';
import 'package:vox_uikit/theme/app_sizes.dart';
import 'package:vox_uikit/theme/app_text_styles.dart';

// MARK: - TextFieldWidget

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    required this.controller,
    this.title,
    this.hint,
    this.onChanged,
    this.onOutsideTapped,
    this.validator,
    this.multiline = false,
    super.key,
  });

  final String? title;
  final String? hint;
  final bool multiline;
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onOutsideTapped;
  final String? Function(String?)? validator;

  static const double height = 44;

  @override
  Widget build(BuildContext context) {
    final textFieldBorderRadius =
        BorderRadius.circular(AppSizes.borderRadius12);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      spacing: 6,
      children: [
        title == null
            ? const SizedBox.shrink()
            : Text(
                title!,
                style: AppTextStyles.s12h16w400$Label.copyWith(
                  color: AppColors.gray900,
                ),
              ),
        TextFormField(
          controller: controller,
          onChanged: onChanged,
          onTapOutside: (_) => onOutsideTapped?.call(),
          validator: validator,
          maxLines: multiline ? 7 : 1,
          minLines: multiline ? 1 : 1,
          decoration: InputDecoration(
            hintText: hint,
            contentPadding: const EdgeInsets.all(12),
            isCollapsed: true,
            filled: true,
            fillColor: AppColors.grayScale50,
            enabledBorder: OutlineInputBorder(
              borderRadius: textFieldBorderRadius,
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: textFieldBorderRadius,
              borderSide: const BorderSide(color: AppColors.main500, width: 2),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: textFieldBorderRadius,
              borderSide: const BorderSide(color: AppColors.error, width: 2),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: textFieldBorderRadius,
              borderSide: const BorderSide(color: AppColors.error, width: 2),
            ),
            hintStyle: AppTextStyles.hintTextStyle,
          ),
          style: AppTextStyles.inputTextStyle,
        ),
      ],
    );
  }
}
