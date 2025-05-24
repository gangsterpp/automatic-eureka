import 'dart:developer';

import 'package:VOX/domain/country.dart';
import 'package:VOX/features/beginning/presentation/pages/auth/widget/phone_number_widget/country_code_picker.dart';
import 'package:VOX/providers/current_country.dart';
import 'package:VOX/providers/profile_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vox_ui_kit/widgets/fields/primary_text_field.dart';

// Кастомный форматтер для ввода номера телефона
class PhoneNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String newText = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');

    if (newText.isEmpty) {
      return const TextEditingValue(
        text: '',
        selection: TextSelection.collapsed(offset: 0),
      );
    }

    StringBuffer formatted = StringBuffer();

    if (newText.isNotEmpty) {
      formatted.write('(');
      formatted.write(
        newText.substring(0, newText.isNotEmpty ? 1 : newText.length),
      );
    }
    if (newText.length > 1) {
      formatted.write(
        newText.substring(1, newText.length >= 3 ? 3 : newText.length),
      );
    }
    if (newText.length > 3) {
      formatted.write(')-');
      formatted.write(
        newText.substring(3, newText.length >= 6 ? 6 : newText.length),
      );
    }
    if (newText.length > 6) {
      formatted.write('-');
      formatted.write(
        newText.substring(6, newText.length >= 8 ? 8 : newText.length),
      );
    }
    if (newText.length > 8) {
      formatted.write('-');
      formatted.write(
        newText.substring(8, newText.length >= 10 ? 10 : newText.length),
      );
    }

    // Возвращаем обновленный текст
    return TextEditingValue(
      text: formatted.toString(),
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}

class PhoneNumberInput extends ConsumerStatefulWidget {
  final double countryCodeWidth;
  final double phoneNumberWidth;
  final double height;
  final ValueChanged<String> onChanged;
  final TextEditingController? textEditingController;
  final VoidCallback? onCountryChanged;

  const PhoneNumberInput({
    super.key,
    this.countryCodeWidth = 78,
    this.phoneNumberWidth = double.infinity,
    this.height = 40,
    this.textEditingController,
    required this.onChanged,
    this.onCountryChanged,
  });

  @override
  ConsumerState createState() => _PhoneNumberInputState();
}

class _PhoneNumberInputState extends ConsumerState<PhoneNumberInput> {
  @override
  Widget build(BuildContext context) {
    final Country? profileCountry =
        ref.watch(profileNotifierProvider).value?.value?.countryCode;

    return Row(
      children: <Widget>[
        CountryCodePicker(
          countryCodeWidth: widget.countryCodeWidth,
          selectedCountryCode: profileCountry?.code ?? '',
          selectedDialCode: profileCountry?.dialCode ?? '',
          onCountrySelected: (Country country) {
            ref.read(currentCountryProvider.notifier).changeCountry(country);
            widget.onCountryChanged?.call();
          },
          height: widget.height,
        ),
        const SizedBox(width: 4),
        Expanded(
          child: PrimaryTextField(
            hintText: 'Телефон',
            height: 40,
            controller: widget.textEditingController,
            onChanged: widget.onChanged,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Введите номер телефона';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }
}
