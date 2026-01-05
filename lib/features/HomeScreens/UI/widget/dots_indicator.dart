import 'package:dots_indicator/dots_indicator.dart';
import 'package:ecommerce_app_food/core/utils/colors.dart';
import 'package:ecommerce_app_food/features/HomeScreens/logic/controller_popularProduct.dart';
import 'package:ecommerce_app_food/features/HomeScreens/logic/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

// ignore: must_be_immutable
class SectionDotsIndicator extends StatelessWidget {
  SectionDotsIndicator({super.key});
  HomeController _controller = Get.find<HomeController>();
  ControllerFood controllerFood = Get.find<ControllerFood>();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Center(
        child: new DotsIndicator(
          dotsCount: controllerFood.newList.isEmpty
              ? 1
              : controllerFood.newList.length,
          position: _controller.currentIndex.value,
          decorator: DotsDecorator(
            activeColor: AppColors.mainColor,
            size: Size.square(7.0.h),
            activeSize: Size(15.0.w, 8.0.h),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0.r),
            ),
          ),
        ),
      );
    });
  }
}
