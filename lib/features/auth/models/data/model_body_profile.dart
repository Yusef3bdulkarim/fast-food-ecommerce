import 'package:equatable/equatable.dart';

class ModelBodyProfile extends Equatable {
  final int id;
  final String fName;
  final String phone;
  final String email;
  final int order_count;

  ModelBodyProfile({
    required this.id,
    required this.fName,
    required this.phone,
    required this.email,
    required this.order_count,
  });

  factory ModelBodyProfile.fromJson(Map<String, dynamic> json) {
    return ModelBodyProfile(
      id: json['id'],
      fName: json['f_name'],
      phone: json['phone'],
      email: json['email'],
      order_count: json['order_count'],
    );
  }

  @override
  List<Object?> get props => [id, fName, phone, email, order_count];
}
