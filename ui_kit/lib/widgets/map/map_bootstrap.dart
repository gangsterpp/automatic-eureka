import 'package:yandex_maps_mapkit/init.dart' as init;

sealed class MapBootstrap {
  Future<void> inititalize();
}

class YandexBootstrap implements MapBootstrap {
  final String locale;
  final String apiKey;
  const YandexBootstrap({this.apiKey = '', this.locale = 'ru_RU'});
  @override
  Future<void> inititalize() async {
    return init.initMapkit(apiKey: apiKey, locale: locale);
  }
}
