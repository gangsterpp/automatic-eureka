import 'dart:convert';

import 'package:VOX/domain/country.dart';
import 'package:VOX/domain/profile.dart';
import 'package:VOX/providers/app_storage.dart';
import 'package:VOX/widgets/profile/gender_selection.dart';

abstract interface class ProfileService {
  Future<Profile> fetchProfile();
  Future<void> deleteProfile();
  Future<void> updateProfile(Profile profile);
}

class MockProfileService implements ProfileService {
  final AppStorage appStorage;

  const MockProfileService(this.appStorage);
  @override
  Future<Profile> fetchProfile() async {
    final response = await appStorage.fetchCustomValue('profile_key');
    if (response != null) {
      return Profile.fromJson(jsonDecode(response));
    }

    /// TODO: Check;
    return Profile(
      name: '',
      countryCode: Country.ru(),
      phone: '',
      city: '',
      userGender: UserGender.female,
    );
  }

  @override
  Future<void> updateProfile(Profile profile) async {
    await appStorage.setCustomValue('profile_key', jsonEncode(profile));
  }

  @override
  Future<void> deleteProfile() {
    return appStorage.clear();
  }
}
