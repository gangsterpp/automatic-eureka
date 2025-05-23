import 'package:flutter/material.dart';

import '../../../core/constants/constants.dart';
import '../../../core/extensions/extensions.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/styles.dart';

@Deprecated('Do not use')
class SecondaryFilledButton extends StatelessWidget {
  const SecondaryFilledButton({required this.title, required this.onPressed, this.height = ButtonHeight.medium, this.width, super.key});

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
          backgroundColor: ThemeColors.whiteA70001.property,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)).property,
          overlayColor: ThemeColors.deepPurpleA50.property,
        ),
        child: Text(title, style: ThemeStyles.s14h600(const Color.fromARGB(255, 198, 202, 209))),
      ),
    );
  }
}
