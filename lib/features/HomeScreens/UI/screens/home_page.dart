import 'package:ecommerce_app_food/core/utils/colors.dart';
import 'package:ecommerce_app_food/core/utils/costume_text.dart';
import 'package:ecommerce_app_food/features/HomeScreens/UI/widget/dots_indicator.dart';
import 'package:ecommerce_app_food/features/HomeScreens/UI/widget/header_homeScreen.dart';
import 'package:ecommerce_app_food/features/HomeScreens/UI/widget/section_slide_card.dart';
import 'package:ecommerce_app_food/features/HomeScreens/UI/widget/slide_background.dart';
import 'package:ecommerce_app_food/features/HomeScreens/logic/controller_popularProduct.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/state_manager.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<ControllerFood>(
        builder: (controller) {
          return controller.isLoading
              ? Padding(
                  padding: EdgeInsets.only(top: 55.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      HeaderHomescreen(),
                      Gap(7.h),
                      SlideBackground(),
                      Gap(0.h),
                      SectionDotsIndicator(),
                      Gap(4.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25.h),
                        child: Row(
                          children: [
                            CostumeText(text: "Recommended"),
                            Gap(15.w),
                            CostumeText(
                              text: "Food paring",
                              color: AppColors.textColor,
                              fontSize: 12.sp,
                            ),
                          ],
                        ),
                      ),
                      Gap(10.h),
                      SectionSlideCard(),
                    ],
                  ),
                )
              : Center(
                  child: CircularProgressIndicator(color: AppColors.mainColor),
                );
        },
      ),
    );
  }
}
