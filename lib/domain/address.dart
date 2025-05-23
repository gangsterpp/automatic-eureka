class Address {
  final String? name;
  final String? city;
  final String? street;
  final String? home;
  final String? intercom;
  final String? floor;
  final String? appartment;
  final String? establishmentName;
  final String? comment;

  const Address({
    this.appartment,
    this.city,
    this.comment,
    this.establishmentName,
    this.floor,
    this.home,
    this.intercom,
    this.name,
    this.street,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      name: json['name'],
      city: json['city'],
      street: json['street'],
      home: json['home'],
      intercom: json['intercom'],
      floor: json['floor'],
      appartment: json['appartment'],
      establishmentName: json['establishment_name'],
      comment: json['comment'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'city': city,
      'street': street,
      'home': home,
      'intercom': intercom,
      'floor': floor,
      'appartment': appartment,
      'establishment_name': establishmentName,
      'comment': comment,
    };
  }
}
