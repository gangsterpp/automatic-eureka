import 'package:VOX/domain/country.dart';
import 'package:flutter/material.dart';
import 'package:vox_ui_kit/core/theme/colors.dart';
import 'package:vox_ui_kit/core/theme/styles.dart';
import 'package:vox_ui_kit/gen/assets.gen.dart';
import 'package:vox_ui_kit/gen/translations.g.dart';
import 'package:vox_ui_kit/widgets/buttons/radio/radio_button.dart';

Future<void> showCountryListBottomSheet({
  required BuildContext context,
  required Function(Country country) onCountrySelected,
  required String? selectedCountryCode,
}) {
  return showModalBottomSheet(
    context: context,
    builder: (context) {
      return Material(
        color: Colors.transparent,
        child: SafeArea(
          child: IntrinsicHeight(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(t.country_code_title),
                Expanded(child: CountryListWidget(onCountrySelected: onCountrySelected, selectedCountryCode: selectedCountryCode)),
              ],
            ),
          ),
        ),
      );
    },
  );
}

class CountryListWidget extends StatefulWidget {
  final Function(Country country) onCountrySelected;
  final String? selectedCountryCode;

  const CountryListWidget({Key? key, required this.onCountrySelected, required this.selectedCountryCode}) : super(key: key);

  @override
  State<CountryListWidget> createState() => _CountryListWidgetState();
}

class _CountryListWidgetState extends State<CountryListWidget> {
  // TODO: Переделать в моделки
  final List<Map<String, String>> countries = [
    {'code': 'RU', 'name': t.country_ru_title, 'dialCode': '+7'},
    {'code': 'KZ', 'name': t.country_kz_title, 'dialCode': '+7'},
    {'code': 'BY', 'name': t.country_by_title, 'dialCode': '+375'},
    {'code': 'AM', 'name': t.country_am_title, 'dialCode': '+374'},
    {'code': 'KG', 'name': t.country_kg_title, 'dialCode': '+996'},
  ];
  Image? get image {
    if (Country.am().code == widget.selectedCountryCode) {
      return Assets.images.auth.flags.am.image(width: 24.4, height: 24.4, package: 'vox_ui_kit');
    }
    if (Country.ru().code == widget.selectedCountryCode) {
      return Assets.images.auth.flags.ru.image(width: 24.4, height: 24.4, package: 'vox_ui_kit');
    }

    if (Country.kz().code == widget.selectedCountryCode) {
      return Assets.images.auth.flags.kz.image(width: 24.4, height: 24.4, package: 'vox_ui_kit');
    }

    if (Country.by().code == widget.selectedCountryCode) {
      return Assets.images.auth.flags.by.image(width: 24.4, height: 24.4, package: 'vox_ui_kit');
    }

    if (Country.kg().code == widget.selectedCountryCode) {
      return Assets.images.auth.flags.kg.image(width: 24.4, height: 24.4, package: 'vox_ui_kit');
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children:
            countries.map((country) {
              return ListTile(
                    leading: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        RadioButton(
                          value: country['code']!,
                          groupValue: widget.selectedCountryCode!,
                          onChanged: (value) {
                            final country = switch (value) {
                              'RU' => Country.ru(),
                              'KZ' => Country.kz(),
                              'BY' => Country.by(),
                              'AM' => Country.am(),
                              'KG' => Country.kg(),
                              _ => Country.ru(),
                            };
                            widget.onCountrySelected(country);
                            Navigator.pop(context);
                          },
                        ),
                        const SizedBox(width: 10),
                        if (image != null) image!,
                      ],
                    ),
                    title: Text(country['name']!, style: ThemeStyles.s18h500(ThemeColors.black90003)),
                    trailing: Text(country['dialCode']!, style: ThemeStyles.s18h500(ThemeColors.blueGray400)),
                    onTap: () {
                      final c = switch (country['code']) {
                        'RU' => Country.ru(),
                        'KZ' => Country.kz(),
                        'BY' => Country.by(),
                        'AM' => Country.am(),
                        'KG' => Country.kg(),
                        _ => Country.ru(),
                      };

                      widget.onCountrySelected(c);
                      Navigator.pop(context);
                    },
                  )
                  as Widget;
            }).toList(),
      ).separatedBuilder(context, separator: (context, index) => const Divider()),
    );
  }
}

// TODOD: надо будет добавить в vox_ui_kit
extension FlexExtensions on MultiChildRenderObjectWidget {
  MultiChildRenderObjectWidget separatedBuilder(
    BuildContext context, {
    required IndexedWidgetBuilder separator,
    bool includeOuterSeparators = false,
  }) {
    final newChildren = <Widget>[];

    if (includeOuterSeparators && children.isNotEmpty) {
      newChildren.add(separator(context, 0));
    }

    for (var i = 0; i < children.length; i++) {
      newChildren.add(children[i]);

      if (i < children.length - 1) {
        newChildren.add(separator(context, i + 1));
      }
    }

    if (includeOuterSeparators && children.isNotEmpty) {
      newChildren.add(separator(context, children.length));
    }

    children
      ..clear()
      ..addAll(newChildren);

    return this;
  }
}
