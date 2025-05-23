// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$profileServiceHash() => r'0d6fd609869e5a3c8310d123331e82a7eca9e535';

/// Провайдер для сервиса профиля.
/// При необходимости его можно переопределять, например, в тестах.
///
/// Copied from [profileService].
@ProviderFor(profileService)
final profileServiceProvider = AutoDisposeProvider<ProfileService>.internal(
  profileService,
  name: r'profileServiceProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$profileServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ProfileServiceRef = AutoDisposeProviderRef<ProfileService>;
String _$profileNotifierHash() => r'399a2c3d96cb2206935c92284a61e9e5e8581d2e';

/// See also [ProfileNotifier].
@ProviderFor(ProfileNotifier)
final profileNotifierProvider =
    AutoDisposeAsyncNotifierProvider<ProfileNotifier, PorfileState>.internal(
      ProfileNotifier.new,
      name: r'profileNotifierProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$profileNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$ProfileNotifier = AutoDisposeAsyncNotifier<PorfileState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
