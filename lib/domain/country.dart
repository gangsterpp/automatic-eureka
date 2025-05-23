import 'package:vox_ui_kit/gen/translations.g.dart';

sealed class Country {
  final String code;
  final String name;
  final String dialCode;

  factory Country.ru() = RU;
  factory Country.kz() = KZ;
  factory Country.by() = BY;
  factory Country.am() = AM;
  factory Country.kg() = KG;

  const Country(this.code, this.name, this.dialCode);
}

class RU extends Country {
  RU() : super('RU', t.country_ru_title, '+7');
}

class KZ extends Country {
  KZ() : super('KZ', t.country_kz_title, '+7');
}

class BY extends Country {
  BY() : super('BY', t.country_by_title, '+375');
}

class AM extends Country {
  AM() : super('AM', t.country_am_title, '+374');
}

class KG extends Country {
  KG() : super('KG', t.country_kg_title, '+996');
}
