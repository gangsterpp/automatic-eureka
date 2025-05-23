import 'package:flutter/material.dart';
import 'package:vox_uikit/theme/app_colors.dart';
import 'package:vox_uikit/theme/app_sizes.dart';
import 'package:vox_uikit/theme/app_text_styles.dart';

class ModalDropdownTextField extends StatefulWidget {
  const ModalDropdownTextField({
    super.key,
    required this.controller,
    required this.onModalPick,
    this.title,
    this.hint,
    this.validator,
    this.showIcon = true,
  });

  final String? title;
  final String? hint;
  final TextEditingController controller;
  final Future<String?> Function() onModalPick;
  final String? Function(String?)? validator;
  final bool showIcon;

  static const double height = 44;

  @override
  State<ModalDropdownTextField> createState() => _ModalDropdownTextFieldState();
}

class _ModalDropdownTextFieldState extends State<ModalDropdownTextField> {
  late final FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  Future<void> _handleTap() async {
    FocusScope.of(context).unfocus();
    final result = await widget.onModalPick();
    if (result != null) {
      widget.controller.text = result;
      _focusNode.unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      spacing: 6,
      children: [
        widget.title == null
            ? const SizedBox.shrink()
            : Text(
                widget.title!,
                style: AppTextStyles.s12h16w400$Label.copyWith(
                  color: AppColors.gray900,
                ),
              ),
        TextFormField(
          focusNode: _focusNode,
          readOnly: true,
          controller: widget.controller,
          validator: widget.validator,
          onTap: _handleTap,
          decoration: InputDecoration(
            hintText: widget.hint,
            contentPadding: const EdgeInsets.all(12),
            isCollapsed: true,
            filled: true,
            fillColor: AppColors.grayScale50,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSizes.borderRadius12),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSizes.borderRadius12),
              borderSide: const BorderSide(color: AppColors.main500, width: 2),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSizes.borderRadius12),
              borderSide: const BorderSide(color: AppColors.error, width: 2),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSizes.borderRadius12),
              borderSide: const BorderSide(color: AppColors.error, width: 2),
            ),
            hintStyle: AppTextStyles.hintTextStyle,
            suffixIcon: !widget.showIcon
                ? null
                : const SizedBox(
                    width: 20,
                    height: 20,
                    child: Align(
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.arrow_drop_down,
                        size: 20,
                        color: AppColors.gray300,
                      ),
                    ),
                  ),
          ),
          style: AppTextStyles.inputTextStyle,
        ),
      ],
    );
  }
}
