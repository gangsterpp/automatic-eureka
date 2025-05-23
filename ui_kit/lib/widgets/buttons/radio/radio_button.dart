import 'package:flutter/material.dart';

import '../../../core/constants/constants.dart';
import '../../../core/theme/colors.dart';

class RadioButton extends StatelessWidget {
  final String value;
  final String groupValue;
  final ValueChanged<String?> onChanged;

  const RadioButton({super.key, required this.value, required this.groupValue, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    bool isSelected = value == groupValue;

    return GestureDetector(
      onTap: () => onChanged(value),
      child: Container(
        width: DefaultSizes.xLarge,
        height: DefaultSizes.xLarge,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: ThemeColors.purpleA10001, width: DefaultSizes.xxxSmall),
        ),
        child:
            isSelected
                ? Center(
                  child: Container(
                    width: DefaultSizes.mediumLarge,
                    height: DefaultSizes.mediumLarge,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [ThemeColors.purpleA100, ThemeColors.purpleA10001],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                )
                : null,
      ),
    );
  }
}
