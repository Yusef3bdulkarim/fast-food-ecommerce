import 'dart:convert';

import 'package:ecommerce_app_food/features/CartScreens/data/models/cart_models.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartRepo {
  final SharedPreferences sharedPreferences;

  CartRepo({required this.sharedPreferences});
  static const String cartListKey = "cart-list";

  void addList(List<CartModels> cartList) {
    List<String> newList = [];
    for (var element in cartList) {
      newList.add(jsonEncode(element.toJson()));
    }
    sharedPreferences.setStringList(cartListKey, newList);
  }

  List<CartModels> getCartList() {
    List<String> carts = [];
    if (sharedPreferences.containsKey(cartListKey)) {
      carts = sharedPreferences.getStringList(cartListKey)!;
    }
    return carts.map((e) => CartModels.fromJson(jsonDecode(e))).toList();
  }
}
