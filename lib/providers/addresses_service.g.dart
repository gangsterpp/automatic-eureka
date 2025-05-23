// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'addresses_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$addressServiceHash() => r'8cd3cdc4ecbb770df111ef9cff2329a756674db0';

/// Провайдер для сервиса профиля.
/// При необходимости его можно переопределять, например, в тестах.
///
/// Copied from [addressService].
@ProviderFor(addressService)
final addressServiceProvider = AutoDisposeProvider<AddressService>.internal(
  addressService,
  name: r'addressServiceProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$addressServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AddressServiceRef = AutoDisposeProviderRef<AddressService>;
String _$addressNotifierHash() => r'3eff827ed8c8674507a258f76f2adcb7530fff7d';

/// See also [AddressNotifier].
@ProviderFor(AddressNotifier)
final addressNotifierProvider =
    AutoDisposeAsyncNotifierProvider<AddressNotifier, AddressState>.internal(
      AddressNotifier.new,
      name: r'addressNotifierProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$addressNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$AddressNotifier = AutoDisposeAsyncNotifier<AddressState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
