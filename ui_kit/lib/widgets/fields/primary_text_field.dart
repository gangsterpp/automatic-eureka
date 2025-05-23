import 'package:flutter/material.dart';

import '../../core/constants/constants.dart';
import '../../core/theme/colors.dart';
import '../../core/theme/styles.dart';
import '../decorations/decorated_background.dart';

class PrimaryTextField extends StatelessWidget {
  const PrimaryTextField({
    super.key,
    this.onTap,
    this.hintText,
    this.validator,
    this.labelText,
    this.onChanged,
    this.controller,
    this.suffixIcon,
    this.prefixIcon,
    this.onFieldSubmitted,
    this.readOnly = false,
    this.onEditingComplete,
    this.height = ButtonHeight.medium,
  });

  final bool readOnly;
  final double height;
  final String? hintText;
  final String? labelText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final VoidCallback? onTap;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final void Function()? onEditingComplete;
  final String? Function(String?)? validator;
  final void Function(String)? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(DefaultSizes.medium);

    return Column(
      spacing: DefaultSizes.xSmall,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText != null) Text(labelText!, style: ThemeStyles.s12h400(ThemeColors.black90003)),
        FormField<String>(
          validator: validator,
          builder: (state) {
            final backgroundColor = state.hasError ? ThemeColors.redLight500 : ThemeColors.gray10002;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: DefaultSizes.xxSmall,
              children: [
                Container(
                  height: height,
                  decoration: BoxDecoration(color: backgroundColor, borderRadius: BorderRadius.circular(DefaultSizes.medium)),
                  child: DecoratedBackground(
                    backgroundColor: backgroundColor,
                    linearGradienColors: [Colors.transparent, Colors.transparent],
                    child: TextFormField(
                      onTap: onTap,
                      onTapOutside: (event) {
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                      readOnly: readOnly,
                      controller: controller,
                      onEditingComplete: onEditingComplete,
                      onFieldSubmitted: onFieldSubmitted,
                      style: ThemeStyles.s14h400(ThemeColors.black90003),
                      decoration: InputDecoration(
                        prefixIcon: prefixIcon,
                        suffixIcon: suffixIcon,
                        suffixIconConstraints: const BoxConstraints(maxWidth: ButtonHeight.medium),
                        contentPadding: const EdgeInsets.all(DefaultSizes.medium),
                        hintStyle: ThemeStyles.s14h400(ThemeColors.blueGray400),
                        hintText: hintText,
                        error: state.hasError ? const SizedBox() : null,
                        border: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: borderRadius),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(width: DefaultSizes.xxxSmall, color: ThemeColors.deepPurpleA20002),
                          borderRadius: borderRadius,
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(width: DefaultSizes.xxxSmall, color: ThemeColors.red),
                          borderRadius: borderRadius,
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(width: DefaultSizes.xxxSmall, color: ThemeColors.red),
                          borderRadius: borderRadius,
                        ),
                      ),
                      onChanged: (value) {
                        onChanged?.call(value);
                        state.didChange(value);
                      },
                    ),
                  ),
                ),
                if (state.hasError) Text(state.errorText ?? '', style: ThemeStyles.s12h400(ThemeColors.red)),
              ],
            );
          },
        ),
      ],
    );
  }
}
