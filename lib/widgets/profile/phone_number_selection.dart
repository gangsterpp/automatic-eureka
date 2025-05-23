import 'package:VOX/features/beginning/presentation/pages/auth/widget/phone_number_widget/phone_number_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:vox_uikit/theme/app_colors.dart';
import 'package:vox_uikit/theme/app_text_styles.dart';

class PhoneNumberSelection extends StatelessWidget {
  const PhoneNumberSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Введите номер телефона',
          style: AppTextStyles.s12h16w400$Label.copyWith(
            color: AppColors.gray900,
          ),
        ),
        const SizedBox(height: 6),
        PhoneNumberInput(onChanged: (String text) {}),
      ],
    );
  }
}
