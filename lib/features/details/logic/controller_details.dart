import 'package:ecommerce_app_food/core/utils/colors.dart';
import 'package:ecommerce_app_food/features/homeScreen/data/models/model_foodApp.dart';
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
  // var price = 12.88.obs;
  var currentprice = 0.0.obs;

  void initProduct(ProductModel product) {
    _product = product;
    currentIndex.value = 1; // تصفير العداد عند فتح صفحة جديدة
    currentprice.value = _product.price!.toDouble();
    _isLoaded = true;
    update();
  }

  void addIndex() {
    if (currentIndex.value < 7) {
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
    if (currentIndex.value > 1) {
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
    // السعر الكلي = الكمية * سعر المنتج من السيرفر
    currentprice.value = currentIndex.value * (_product.price ?? 0).toDouble();
  }

  // void showPrice() {
  //   currentprice == currentIndex.value * price.value;
  // }

  void toggleIcons() {
    isEnterIcon.value = !isEnterIcon.value;
  }

  void toggleText() {
    isExpand.value = !isExpand.value;
  }
}
