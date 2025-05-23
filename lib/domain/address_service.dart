import 'dart:convert';

import 'package:VOX/domain/address.dart';
import 'package:VOX/providers/app_storage.dart';

abstract interface class AddressService {
  Future<List<Address>> fetchAddresses();
  Future<void> updateAddress(List<Address> addresses);
}

class MockAddressService implements AddressService {
  final AppStorage appStorage;
  const MockAddressService(this.appStorage);
  @override
  Future<List<Address>> fetchAddresses() async {
    final response = await appStorage.fetchCustomList('address_key');
    if (response != null) {
      return response.map((e) => Address.fromJson(jsonDecode(e))).toList();
    }
    return [];
  }

  @override
  Future<void> updateAddress(List<Address> addresses) async {
    await appStorage.setCustomList('address_key', addresses.map((e) => jsonEncode(e)).toList());
  }
}
