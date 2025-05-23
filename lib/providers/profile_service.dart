import 'dart:async';

import 'package:VOX/domain/profile.dart';
import 'package:VOX/domain/profile_service.dart';
import 'package:VOX/providers/app_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'profile_service.g.dart';

/// Провайдер для сервиса профиля.
/// При необходимости его можно переопределять, например, в тестах.
@riverpod
ProfileService profileService(Ref ref) {
  return MockProfileService(ref.read(appStorageProvider));
}

@riverpod
class ProfileNotifier extends _$ProfileNotifier {
  @override
  Future<PorfileState> build() async {
    state = const AsyncData(ProfileLoading());
    final service = ref.watch(profileServiceProvider);
    return ProfileLoaded(await service.fetchProfile());
  }

  Future<void> updateProfile(Profile newProfile) async {
    try {
      state = const AsyncData(ProfileLoading());

      await ref.read(profileServiceProvider).updateProfile(newProfile);
      await Future.delayed(const Duration(seconds: 1));

      state = AsyncData(ProfileLoaded(newProfile));
    } catch (error, _) {
      state = AsyncData(ProfileError(error.toString()));
    }
  }

  Future<void> deleteProfile() async {
    try {
      state = const AsyncData(ProfileLoading());

      await ref.read(profileServiceProvider).deleteProfile();
      await Future.delayed(const Duration(seconds: 1));

      state = const AsyncData(ProfileDeleted());
    } catch (error, _) {
      state = AsyncData(ProfileError(error.toString()));
    }
  }
}

sealed class PorfileState {
  const PorfileState();
  Profile? get value => null;
}

class ProfileIdle extends PorfileState {
  const ProfileIdle();
}

class ProfileLoading extends PorfileState {
  const ProfileLoading();
}

class ProfileError extends PorfileState {
  final String error;
  const ProfileError(this.error);
}

class ProfileLoaded extends PorfileState {
  @override
  Profile? get value => profile;
  final Profile profile;
  const ProfileLoaded(this.profile);
}

class ProfileDeleted extends PorfileState {
  const ProfileDeleted();
}
