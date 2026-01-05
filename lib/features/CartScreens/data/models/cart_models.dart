import 'package:ecommerce_app_food/core/models/model_foodApp.dart';
import 'package:equatable/equatable.dart';

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
}
