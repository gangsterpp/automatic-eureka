import 'package:VOX/domain/country.dart';
import 'package:VOX/features/beginning/presentation/pages/auth/widget/country_list_bottom_sheet.dart';
import 'package:VOX/features/beginning/presentation/pages/auth/widget/phone_number_widget/icon_text_button.dart';
import 'package:flutter/material.dart';
import 'package:vox_ui_kit/gen/assets.gen.dart';

class CountryCodePicker extends StatefulWidget {
  final double countryCodeWidth;
  final double height;
  final String selectedCountryCode;
  final String selectedDialCode;
  final Function(Country country) onCountrySelected;

  const CountryCodePicker({
    super.key,
    required this.countryCodeWidth,
    required this.height,
    required this.selectedCountryCode,
    required this.selectedDialCode,
    required this.onCountrySelected,
  });

  @override
  State createState() => _CountryCodePickerState();
}

class _CountryCodePickerState extends State<CountryCodePicker> {
  late String selectedCountryCode;

  Image? get image {
    if (Country.am().code == selectedCountryCode) {
      return Assets.images.auth.flags.am.image(width: 24.4, height: 24.4, package: 'vox_ui_kit');
    }
    if (Country.ru().code == selectedCountryCode) {
      return Assets.images.auth.flags.ru.image(width: 24.4, height: 24.4, package: 'vox_ui_kit');
    }

    if (Country.kz().code == selectedCountryCode) {
      return Assets.images.auth.flags.kz.image(width: 24.4, height: 24.4, package: 'vox_ui_kit');
    }

    if (Country.by().code == selectedCountryCode) {
      return Assets.images.auth.flags.by.image(width: 24.4, height: 24.4, package: 'vox_ui_kit');
    }

    if (Country.kg().code == selectedCountryCode) {
      return Assets.images.auth.flags.kg.image(width: 24.4, height: 24.4, package: 'vox_ui_kit');
    }

    return null;
  }

  @override
  void initState() {
    super.initState();
    selectedCountryCode = widget.selectedCountryCode;
  }

  void _openCountrySelectionDialog(BuildContext context) {
    showCountryListBottomSheet(
      context: context,
      onCountrySelected: (country) {
        setState(() {
          selectedCountryCode = country.code;
        });
        widget.onCountrySelected(country);
      },
      selectedCountryCode: selectedCountryCode,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _openCountrySelectionDialog(context),
      child: IconTextButton(
        width: widget.countryCodeWidth,
        height: widget.height,
        image: image,
        onPressed: () => _openCountrySelectionDialog(context),
        title: widget.selectedDialCode,
      ),
    );
  }
}
