import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ModelBodyAuth {
  final String name;
  final String email;
  final String password;
  final String phone;

  ModelBodyAuth({
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
  });

  @override
  String toString() {
    return 'ModelBodyAuth(name: $name, email: $email, password: $password, phone: $phone)';
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "f_name": name, // السيرفر محتاج f_name
      "l_name": "User", // السيرفر بيشترط وجود l_name
      'email': email,
      'password': password,
      'phone': phone,
    };
  }

  factory ModelBodyAuth.fromMap(Map<String, dynamic> map) {
    return ModelBodyAuth(
      name: map['name'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      phone: map['phone'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ModelBodyAuth.fromJson(String source) =>
      ModelBodyAuth.fromMap(json.decode(source) as Map<String, dynamic>);
}
