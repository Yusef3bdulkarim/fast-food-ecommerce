import 'dart:convert';

import 'package:ecommerce_app_food/core/utils/constans_app.dart';
import 'package:ecommerce_app_food/features/CartScreens/data/models/cart_models.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartRepo {
  final SharedPreferences sharedPreferences;

  CartRepo({required this.sharedPreferences});

  void addList(List<CartModels> cartList) {
    List<String> newList = [];
    for (var element in cartList) {
      newList.add(jsonEncode(element.toJson()));
    }
    sharedPreferences.setStringList(ConstantsApp.cartListKey, newList);
  }

  List<CartModels> getCartList() {
    List<String> carts = [];
    if (sharedPreferences.containsKey(ConstantsApp.cartListKey)) {
      carts = sharedPreferences.getStringList(ConstantsApp.cartListKey)!;
    }
    return carts.map((e) => CartModels.fromJson(jsonDecode(e))).toList();
  }
}
