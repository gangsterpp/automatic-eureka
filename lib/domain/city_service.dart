import 'package:VOX/domain/city.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'city_service.g.dart';

abstract interface class CityService {
  Future<List<City>> fetchCities(String query);
  Future<void> close();
}

class MockCityService implements CityService {
  @override
  Future<List<City>> fetchCities(String query) async {
    if (query.isEmpty) {
      return [];
    }
    return [const City(name: 'Москва', code: 'MSK'), const City(name: 'Санкт-Петербург', code: 'SPB')];
  }

  @override
  Future<void> close() async {}
}

@riverpod
CityService cityService(Ref ref) {
  return MockCityService();
}
