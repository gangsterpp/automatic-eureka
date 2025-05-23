import 'package:VOX/widgets/profile/gender_selection.dart';

class Profile {
  final String? urlPath;
  final String? name;
  final String? phone;
  final String? city;
  final UserGender? userGender;

  const Profile({
    this.urlPath,
    this.name,
    this.phone,
    this.city,
    this.userGender,
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      urlPath: json['url_path'],
      name: json['name'],
      phone: json['phone'],
      city: json['city'],
      userGender: genderFromString(json['gender']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'url_path': urlPath,
      'name': name,
      'phone': phone,
      'city': city,
      'gender': genderToString(userGender),
    };
  }

  Profile copyWith({
    String? urlPath,
    String? name,
    String? phone,
    String? city,
    UserGender? userGender,
  }) {
    return Profile(
      urlPath: urlPath ?? this.urlPath,
      name: name ?? this.name,
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
