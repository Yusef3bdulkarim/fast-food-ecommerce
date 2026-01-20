class LoginBodyModel {
  final String password;
  final String phone;

  LoginBodyModel({required this.password, required this.phone});

  Map<String, dynamic> toMap() {
    return {'password': password, 'phone': phone};
  }
}
