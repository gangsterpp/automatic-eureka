import 'package:VOX/domain/country.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'current_country.g.dart';

@riverpod
class CurrentCountry extends _$CurrentCountry {
  @override
  Country build() {
    return Country.ru();
  }

  void changeCountry(Country newCountry) {
    state = newCountry;
  }
}
