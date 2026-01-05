import 'package:ecommerce_app_food/core/models/model_foodApp.dart';
import 'package:get/get.dart';

class ControllerRecommend extends GetxController {
  late ProductModel _productModel;
  ProductModel get product => _productModel;
  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;
  var currentIndex = 1.obs;
  RxDouble currentPrice = 0.0.obs;
  var isEnterIcon = false.obs;

  void initRecommended(ProductModel id) {
    _productModel = id;
    currentIndex.value = 1;
    currentPrice.value = _productModel.price!.toDouble();
    _isLoaded = true;
    update();
  }

  void addIndex() {
    currentIndex.value++;
    calculatePrice();
  }

  void minesIndex() {
    if (currentIndex.value > 1) {
      currentIndex.value--;
      calculatePrice();
    }
  }

  void calculatePrice() {
    // السعر الكلي = الكمية * سعر المنتج من السيرفر
    currentPrice.value =
        currentIndex.value * (_productModel.price ?? 0).toDouble();
  }

  void toggleIcons() {
    isEnterIcon.value = !isEnterIcon.value;
  }
}
