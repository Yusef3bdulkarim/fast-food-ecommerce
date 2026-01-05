import 'package:ecommerce_app_food/core/utils/costume_text.dart';
import 'package:ecommerce_app_food/features/HomeScreens/logic/controller_popularProduct.dart';
import 'package:ecommerce_app_food/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HeaderHomescreen extends StatelessWidget {
  const HeaderHomescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Container(
        // height: 60.h,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.r)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                CostumeText(text: "Bangladesh", color: AppColors.mainColor),
                Row(
                  children: [
                    CostumeText(
                      text: "Narshingdi",
                      color: AppColors.titleColor,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    Icon(Icons.arrow_drop_down),
                  ],
                ),
              ],
            ),
            GetBuilder<ControllerFood>(
              init: Get.find<ControllerFood>(),
              builder: (controller) {
                return GestureDetector(
                  child: Container(
                    height: 45.h,
                    width: 45.w,
                    decoration: BoxDecoration(
                      color: AppColors.mainColor,
                      borderRadius: BorderRadius.circular(12.sp),
                    ),
                    child: Icon(Icons.search, color: Colors.white, size: 25.sp),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
