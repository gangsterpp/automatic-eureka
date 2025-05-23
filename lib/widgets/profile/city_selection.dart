import 'package:VOX/widgets/dropdown_textfield_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:vox_uikit/theme/app_colors.dart';
import 'package:vox_uikit/theme/app_text_styles.dart';

class CitySelection extends StatelessWidget {
  final TextEditingController cityTextController;

  const CitySelection({required this.cityTextController, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Город',
          style: AppTextStyles.s12h16w400$Label.copyWith(
            color: AppColors.gray900,
          ),
        ),
        const SizedBox(height: 6),
        DropdownTextFieldWidget(
          controller: cityTextController,
          hint: 'Москва',
          items: const <String>[
            'Москва',
            'Санкт-Петербург',
            'Екатеринбург',
            'Ростов-на-Дону',
            'Нижний Новгород',
            'Краснодар',
            'Сочи',
            'Адлер',
            'Красная Поляна',
          ],
          subItems: const <String>[
            'Москва',
            'Ленинградская область',
            'Свердловская область',
            'Ростовская область',
            'Нижегородская область',
            'Краснодарский край',
            'Краснодарский край',
            'Краснодарский край',
            'Краснодарский край',
          ],
        ),
      ],
    );
  }
}
