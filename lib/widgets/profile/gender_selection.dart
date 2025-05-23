import 'package:flutter/material.dart';
import 'package:vox_uikit/theme/app_colors.dart';
import 'package:vox_uikit/theme/app_text_styles.dart';

enum UserGender { female, male }

class GenderSelector extends StatefulWidget {
  final UserGender selectedGender;
  final ValueChanged<UserGender> onChanged;

  const GenderSelector({
    required this.selectedGender,
    required this.onChanged,
    super.key,
  });

  @override
  State<GenderSelector> createState() => _GenderSelectorState();
}

class _GenderSelectorState extends State<GenderSelector> {
  final Map<UserGender, String> genderLabels = <UserGender, String>{
    UserGender.male: 'Мужской',
    UserGender.female: 'Женский',
  };

  @override
  Widget build(BuildContext context) {
    final double fullWidth = MediaQuery.sizeOf(context).width;
    final double boxWidth = (fullWidth - 44) / 2;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Пол',
          style: AppTextStyles.s12h16w400$Label.copyWith(
            color: AppColors.gray900,
          ),
        ),
        const SizedBox(height: 4),
        SizedBox(
          height: 44,
          width: fullWidth,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: AppColors.grayScale50,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Stack(
              children: <Widget>[
                AnimatedAlign(
                  alignment:
                      widget.selectedGender == UserGender.male
                          ? Alignment.centerLeft
                          : Alignment.centerRight,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: SizedBox(
                      height: 36,
                      width: boxWidth,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  children:
                      genderLabels.entries.map((MapEntry entry) {
                        final UserGender gender = entry.key;
                        final String label = entry.value;
                        final bool isSelected = widget.selectedGender == gender;

                        return Expanded(
                          child: GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onTap: () => widget.onChanged(gender),
                            child: Container(
                              alignment: Alignment.center,
                              child: Text(
                                label,
                                style: AppTextStyles.s14h20w500$Caption
                                    .copyWith(
                                      color:
                                          isSelected
                                              ? AppColors.gray900
                                              : AppColors.gray400,
                                    ),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
