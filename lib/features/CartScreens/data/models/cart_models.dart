// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:ecommerce_app_food/features/HomeScreens/data/models/model_foodApp.dart';

// ignore: must_be_immutable
class CartModels extends Equatable {
  int? id;
  String? name;
  int? price;
  String? img;
  int? quantity;
  bool? isExcited;
  String? time;

  CartModels({
    this.id,
    this.name,
    this.price,
    this.img,
    this.quantity,
    this.isExcited,
    this.time,
  });

  CartModels.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    img = json['img'];
    quantity = json['quantity'];
    isExcited = json['isExcited'];
    time = json['time'];
  }
  ProductModel toProductModel() {
    return ProductModel(
      id: this.id,
      name: this.name,
      price: this.price,
      img: this.img,
    );
  }

  @override
  List<Object?> get props => [
    time,
    id,
    name,
    price,
    img,
    quantity,
    isExcited,
    time,
  ];

  CartModels copyWith({
    int? id,
    String? name,
    int? price,
    String? img,
    int? quantity,
    bool? isExcited,
    String? time,
  }) {
    return CartModels(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      img: img ?? this.img,
      quantity: quantity ?? this.quantity,
      isExcited: isExcited ?? this.isExcited,
      time: time ?? this.time,
    );
  }
}
