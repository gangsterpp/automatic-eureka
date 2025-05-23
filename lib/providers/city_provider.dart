import 'package:VOX/domain/city.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cityQueryProvider = StateProvider<String>((ref) => '');

final currentCityProvider = StateProvider<City?>((ref) => null);
