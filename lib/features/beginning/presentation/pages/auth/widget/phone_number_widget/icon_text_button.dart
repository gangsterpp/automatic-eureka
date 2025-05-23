import 'package:flutter/material.dart';
import 'package:vox_ui_kit/core/constants/constants.dart';
import 'package:vox_ui_kit/core/extensions/extensions.dart';
import 'package:vox_ui_kit/core/theme/colors.dart';
import 'package:vox_ui_kit/core/theme/styles.dart';
import 'package:vox_ui_kit/widgets/decorations/decorated_background.dart';

class IconTextButton extends StatelessWidget {
  const IconTextButton({required this.title, required this.onPressed, this.height, this.width, super.key, this.image});

  final String title;
  final double? width;
  final double? height;
  final Image? image;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final isDisabled = onPressed == null;
    const backgroundColor = ThemeColors.gray10002;
    final textColor = isDisabled ? ThemeColors.blueGray200 : ThemeColors.black90003;

    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          elevation: const WidgetStatePropertyAll(0),
          backgroundBuilder: (context, states, child) {
            return DecoratedBackground(
              backgroundColor: backgroundColor,
              linearGradienColors: const [Colors.transparent, Colors.transparent],
              child: child!,
            );
          },
          backgroundColor: backgroundColor.property,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(DefaultSizes.medium)).property,
          padding: const WidgetStatePropertyAll(EdgeInsets.all(DefaultSizes.small)),
        ),
        child: Row(
          children: [
            if (image != null) image!,
            const SizedBox(width: 3.6),
            Text(title, style: ThemeStyles.s14h600(textColor), overflow: TextOverflow.ellipsis),
          ],
        ),
      ),
    );
  }
}
