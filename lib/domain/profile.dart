class Profile {
  final String? urlPath;
  final String? name;

  final String? phone;
  final String? city;
  const Profile({this.urlPath, this.name, this.phone, this.city});

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(urlPath: json['url_path'], name: json['name'], phone: json['phone'], city: json['city']);
  }

  Map<String, dynamic> toJson() {
    return {'url_path': urlPath, 'name': name, 'phone': phone, 'city': city};
  }

  Profile copyWith({String? urlPath, String? name, String? phone, String? city}) {
    return Profile(urlPath: urlPath ?? this.urlPath, name: name ?? this.name, phone: phone ?? this.phone, city: city ?? this.city);
  }
}
