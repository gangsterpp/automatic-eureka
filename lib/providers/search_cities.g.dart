// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_cities.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchCitiesHash() => r'c7e9fc4a535289cd3c2d23f8c67f86e190b5398d';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [fetchCities].
@ProviderFor(fetchCities)
const fetchCitiesProvider = FetchCitiesFamily();

/// See also [fetchCities].
class FetchCitiesFamily extends Family<AsyncValue<List<City>>> {
  /// See also [fetchCities].
  const FetchCitiesFamily();

  /// See also [fetchCities].
  FetchCitiesProvider call(String query) {
    return FetchCitiesProvider(query);
  }

  @override
  FetchCitiesProvider getProviderOverride(
    covariant FetchCitiesProvider provider,
  ) {
    return call(provider.query);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'fetchCitiesProvider';
}

/// See also [fetchCities].
class FetchCitiesProvider extends AutoDisposeFutureProvider<List<City>> {
  /// See also [fetchCities].
  FetchCitiesProvider(String query)
    : this._internal(
        (ref) => fetchCities(ref as FetchCitiesRef, query),
        from: fetchCitiesProvider,
        name: r'fetchCitiesProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$fetchCitiesHash,
        dependencies: FetchCitiesFamily._dependencies,
        allTransitiveDependencies: FetchCitiesFamily._allTransitiveDependencies,
        query: query,
      );

  FetchCitiesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.query,
  }) : super.internal();

  final String query;

  @override
  Override overrideWith(
    FutureOr<List<City>> Function(FetchCitiesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchCitiesProvider._internal(
        (ref) => create(ref as FetchCitiesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        query: query,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<City>> createElement() {
    return _FetchCitiesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchCitiesProvider && other.query == query;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, query.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FetchCitiesRef on AutoDisposeFutureProviderRef<List<City>> {
  /// The parameter `query` of this provider.
  String get query;
}

class _FetchCitiesProviderElement
    extends AutoDisposeFutureProviderElement<List<City>>
    with FetchCitiesRef {
  _FetchCitiesProviderElement(super.provider);

  @override
  String get query => (origin as FetchCitiesProvider).query;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
