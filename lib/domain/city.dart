class City {
  final String name;
  final String code;

  const City({required this.name, required this.code});

  factory City.fromJson(Map<String, dynamic> json) {
    return City(name: json['name'], code: json['code']);
  }

  Map<String, dynamic> toJson() {
    return {'name': name, 'code': code};
  }
}
