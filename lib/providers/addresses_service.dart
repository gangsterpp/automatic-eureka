import 'dart:async';

import 'package:VOX/domain/address.dart';
import 'package:VOX/domain/address_service.dart';
import 'package:VOX/providers/app_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'addresses_service.g.dart';

/// Провайдер для сервиса профиля.
/// При необходимости его можно переопределять, например, в тестах.
@riverpod
AddressService addressService(Ref ref) {
  return MockAddressService(ref.read(appStorageProvider));
}

@riverpod
class AddressNotifier extends _$AddressNotifier {
  @override
  Future<AddressState> build() async {
    state = const AsyncData(AddressLoading());
    final service = ref.watch(addressServiceProvider);
    return AddressLoaded(await service.fetchAddresses());
  }

  Future<void> updateAddress(List<Address> addresses) async {
    try {
      state = const AsyncData(AddressLoading());

      await ref.read(addressServiceProvider).updateAddress(addresses);
      await Future.delayed(const Duration(seconds: 1));

      state = AsyncData(AddressUpdated(addresses));
    } catch (error, _) {
      state = AsyncData(AddressError(error.toString()));
    }
  }
}

sealed class AddressState {
  const AddressState();
  List<Address> get value => [];
}

class AddressIdle extends AddressState {
  const AddressIdle();
}

class AddressLoading extends AddressState {
  const AddressLoading();
}

class AddressError extends AddressState {
  final String error;
  const AddressError(this.error);
}

class AddressLoaded extends AddressState {
  @override
  List<Address> get value => addresses;
  final List<Address> addresses;
  const AddressLoaded(this.addresses);
}

class AddressUpdated extends AddressState {
  @override
  List<Address> get value => addresses;
  final List<Address> addresses;
  const AddressUpdated(this.addresses);
}
