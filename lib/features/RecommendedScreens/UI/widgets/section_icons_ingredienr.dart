import 'package:ecommerce_app_food/core/utils/costume_text.dart';
import 'package:ecommerce_app_food/core/utils/colors.dart';
import 'package:ecommerce_app_food/features/RecommendedScreens/logic/controller_ingredient.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/state_manager.dart';

// ignore: must_be_immutable
class SectionIconsIngredienr extends StatelessWidget {
  SectionIconsIngredienr({super.key});
  ControllerRecommend _controller = Get.put(ControllerRecommend());
  var product = Get.find<ControllerRecommend>().product;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () => _controller.minesIndex(),
            child: Container(
              height: 40.h,
              width: 40.h,
              decoration: BoxDecoration(
                color: AppColors.mainColor,
                borderRadius: BorderRadius.circular(40.r),
              ),
              child: Icon(Icons.remove, size: 20.sp, color: Colors.white),
            ),
          ),

          Gap(20.h),
          Obx(() {
            return CostumeText(
              text: "\$ ${product.price} X ${_controller.currentIndex.value}",
              color: Colors.black,
              fontSize: 16.sp,
            );
          }),
          Gap(20.h),

          GestureDetector(
            onTap: () => _controller.addIndex(),
            child: Container(
              height: 40.h,
              width: 40.w,
              decoration: BoxDecoration(
                color: AppColors.mainColor,
                borderRadius: BorderRadius.circular(40.r),
              ),
              child: Icon(Icons.add, size: 20.sp, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
