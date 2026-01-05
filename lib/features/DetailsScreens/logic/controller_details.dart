import 'package:ecommerce_app_food/core/utils/colors.dart';
import 'package:ecommerce_app_food/core/models/model_foodApp.dart';
import 'package:ecommerce_app_food/features/CartScreens/logic/controller_carts.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';

class ControllerDetails extends GetxController {
  late ProductModel _product;
  ProductModel get product => _product;
  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;
  var isExpand = false.obs;
  var isEnterIcon = false.obs;
  var currentIndex = 1.obs;
  var currentprice = 0.0.obs;
  // int get currentprice => _product.price!;

  void initProduct(ProductModel product, ControllerCarts cartController) {
    _product = product;
    int existQuantity = cartController.getQuantity(product);

    if (existQuantity > 0) {
      currentIndex.value =
          existQuantity; // لو موجود، حط كميته القديمة في العداد
    } else {
      currentIndex.value = 1; // لو مش موجود، ابدأ من 1
    }

    _isLoaded = true;
    calculatePrice();
    update();
  }

  void addIndex() {
    if (currentIndex.value < 10) {
      currentIndex.value++;
      calculatePrice();
    } else {
      Get.snackbar(
        "Items Count",
        "This Count isn't Correct , You Should Add More ",
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
      );
    }
  }

  void minesIndex() {
    if (currentIndex.value >= 1) {
      currentIndex.value--;
      calculatePrice();
    } else {
      Get.snackbar(
        "Items Count",
        "You can't redues more ! ",
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
      );
    }
  }

  void calculatePrice() {
    currentprice.value = (product.price! * currentIndex.value).toDouble();
  }

  void toggleIcons() {
    isEnterIcon.value = !isEnterIcon.value;
  }

  void toggleText() {
    isExpand.value = !isExpand.value;
  }
}
