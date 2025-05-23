import 'package:VOX/domain/country.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

String? formatPhone(String value, Country? country) {
  final russiaFormatter = MaskTextInputFormatter(
    mask: '+7 (###)-###-##-##',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );
  final armeniaMaskFormatter = MaskTextInputFormatter(mask: '+374 (##)-##-##-##', filter: {"#": RegExp(r'[0-9]')});
  final belarusMaskFormatter = MaskTextInputFormatter(mask: '+375 (##)-###-##-##', filter: {"#": RegExp(r'[0-9]')});
  final kazakhstanMaskFormatter = MaskTextInputFormatter(mask: '+7 (###)-###-##-##', filter: {"#": RegExp(r'[0-9]')});
  final kyrgyzstanMaskFormatter = MaskTextInputFormatter(mask: '+996 (###)-##-##-##', filter: {"#": RegExp(r'[0-9]')});
  return switch (country) {
    null => null,
    RU _ => russiaFormatter.formatEditUpdate(const TextEditingValue(text: ''), TextEditingValue(text: value)).text,

    KZ _ => kazakhstanMaskFormatter.formatEditUpdate(const TextEditingValue(text: ''), TextEditingValue(text: value)).text,

    BY _ => belarusMaskFormatter.formatEditUpdate(const TextEditingValue(text: ''), TextEditingValue(text: value)).text,

    AM _ => armeniaMaskFormatter.formatEditUpdate(const TextEditingValue(text: ''), TextEditingValue(text: value)).text,

    KG _ => kyrgyzstanMaskFormatter.formatEditUpdate(const TextEditingValue(text: ''), TextEditingValue(text: value)).text,
  };
}
