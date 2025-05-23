import 'package:VOX/domain/city.dart';
import 'package:VOX/domain/city_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_cities.g.dart';

@riverpod
Future<List<City>> fetchCities(Ref ref, String query) async {
  // We capture whether the provider is currently disposed or not.
  var didDispose = false;
  ref.onDispose(() => didDispose = true);

  // We delay the request by 500ms, to wait for the user to stop refreshing.
  await Future<void>.delayed(const Duration(milliseconds: 200));

  // If the provider was disposed during the delay, it means that the user
  // refreshed again. We throw an exception to cancel the request.
  // It is safe to use an exception here, as it will be caught by Riverpod.
  if (didDispose) {
    throw Exception('Cancelled');
  }

  // The following code is unchanged from the previous snippet
  final CityService client = ref.read(cityServiceProvider);
  ref.onDispose(client.close);

  return await client.fetchCities(query);
}
