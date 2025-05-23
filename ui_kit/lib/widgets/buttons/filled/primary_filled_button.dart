import 'package:flutter/material.dart';

import '../../../core/constants/constants.dart';
import '../../../core/extensions/extensions.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/styles.dart';

@Deprecated('Do not use')
class PrimaryFilledButton extends StatelessWidget {
  const PrimaryFilledButton({required this.title, required this.onPressed, this.height = ButtonHeight.medium, this.width, super.key});

  final String title;
  final double? width;
  final double height;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: FilledButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: ThemeColors.deepPurpleA20004.property,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)).property,
        ),
        child: Text(title, style: ThemeStyles.s14h600(ThemeColors.whiteA70001)),
      ),
    );
  }
}
