base class AddressModel {
  final String addressCity;
  final String addressStreet;
  final String addressHouse;
  final String addressIntercom;
  final String addressFloor;
  final String addressFlat;
  final String addressComment;

  /// [isValidAddress] - если определена, поведение геттера [isValid] будет определяться её результатом
  final bool Function(AddressModel value)? isValidAddress;

  String get address => '$addressStreet, $addressHouse';

  /// [isValidAddress] - если определена, поведение геттера [isValid] будет определяться её результатом
  bool get isValid => isValidAddress?.call(this) ?? addressStreet.isNotEmpty && addressHouse.isNotEmpty;

  const AddressModel({
    required this.addressCity,
    required this.addressStreet,
    required this.addressHouse,
    required this.addressIntercom,
    required this.addressFloor,
    required this.addressFlat,
    required this.addressComment,
    required this.isValidAddress,
  });
}
