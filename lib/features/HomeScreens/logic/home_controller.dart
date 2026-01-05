import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class HomeController extends GetxController {
  final PageController pageController = PageController(viewportFraction: 0.9);
  final RxDouble currentIndex = 0.0.obs;
  @override
  void onInit() {
    super.onInit();
    pageController.addListener(() {
      currentIndex.value = pageController.page ?? 0.0;
    });
  }
}
