import 'package:VOX/domain/country.dart';
import 'package:VOX/widgets/profile/gender_selection.dart';

class Profile {
  final String? urlPath;
  final String? name;
  final Country? countryCode;
  final String? phone;
  final String? city;
  final UserGender? userGender;

  const Profile({
    this.urlPath,
    this.name,
    this.countryCode,
    this.phone,
    this.city,
    this.userGender,
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      urlPath: json['url_path'],
      name: json['name'],
      countryCode: countryFromString(json['countryCode']),
      phone: json['phone'],
      city: json['city'],
      userGender: genderFromString(json['gender']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'url_path': urlPath,
      'name': name,
      'countryCode': countryToString(countryCode),
      'phone': phone,
      'city': city,
      'gender': genderToString(userGender),
    };
  }

  Profile copyWith({
    String? urlPath,
    String? name,
    Country? countryCode,
    String? phone,
    String? city,
    UserGender? userGender,
  }) {
    return Profile(
      urlPath: urlPath ?? this.urlPath,
      name: name ?? this.name,
      countryCode: countryCode ?? this.countryCode,
      phone: phone ?? this.phone,
      city: city ?? this.city,
      userGender: userGender ?? this.userGender,
    );
  }
}

UserGender? genderFromString(dynamic genderStr) {
  if (genderStr == null) return null;
  switch (genderStr.toString().toLowerCase()) {
    case 'female':
      return UserGender.female;
    case 'male':
      return UserGender.male;
    default:
      return null;
  }
}

String? genderToString(UserGender? gender) {
  if (gender == null) return null;
  switch (gender) {
    case UserGender.female:
      return 'female';
    case UserGender.male:
      return 'male';
  }
}

Country? countryFromString(String? code) {
  switch (code) {
    case 'RU':
      return Country.ru();
    case 'KZ':
      return Country.kz();
    case 'BY':
      return Country.by();
    case 'AM':
      return Country.am();
    case 'KG':
      return Country.kg();
    default:
      return null;
  }
}

String? countryToString(Country? country) {
  return country?.code;
}
