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
  String? description;
  int? stars;
  String? location;
  int? typeId;

  CartModels({
    this.id,
    this.name,
    this.price,
    this.img,
    this.quantity,
    this.isExcited,
    this.time,
    this.description,
    this.stars,
    this.location,
    this.typeId,
  });
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'img': img,
      'quantity': quantity,
      'isExcited': isExcited,
      'time': time,
      'description': description,
      'stars': stars,
      'location': location,
      'type_id': typeId,
    };
  }

  CartModels.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    img = json['img'];
    quantity = json['quantity'];
    isExcited = json['isExcited'];
    time = json['time'];
    description = json['description'];
    stars = json['stars'];
    location = json['location'];
    typeId = json['type_id'];
  }
  ProductModel toProductModel() {
    return ProductModel(
      id: this.id,
      name: this.name,
      price: this.price,
      img: this.img,
      description: description,
      stars: stars,
      location: location,
      typeId: typeId,
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
    description,
    stars,
    location,
    typeId,
  ];

  CartModels copyWith({
    int? id,
    String? name,
    int? price,
    String? img,
    int? quantity,
    bool? isExcited,
    String? time,
    String? description,
    int? stars,
    String? location,
    int? typeId,
  }) {
    return CartModels(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      img: img ?? this.img,
      quantity: quantity ?? this.quantity,
      isExcited: isExcited ?? this.isExcited,
      time: time ?? this.time,
      description: description ?? this.description,
      stars: stars ?? this.stars,
      location: location ?? this.location,
      typeId: typeId ?? this.typeId,
    );
  }

  @override
  bool get stringify => true;
}
