import 'package:ecommerce_app_food/core/utils/colors.dart';
import 'package:ecommerce_app_food/core/utils/costume_text.dart';
import 'package:ecommerce_app_food/features/homeScreen/UI/widget/dots_indicator.dart';
import 'package:ecommerce_app_food/features/homeScreen/UI/widget/header_homeScreen.dart';
import 'package:ecommerce_app_food/features/homeScreen/UI/widget/section_slide_card.dart';
import 'package:ecommerce_app_food/features/homeScreen/UI/widget/slide_background.dart';
import 'package:ecommerce_app_food/features/homeScreen/logic/controller_popularProduct.dart';
import 'package:flutter/material.dart';
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
                  padding: const EdgeInsets.only(top: 55, left: 0, right: 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      HeaderHomescreen(),
                      Gap(7),
                      SlideBackground(),
                      Gap(15),
                      SectionDotsIndicator(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Row(
                          children: [
                            CostumeText(text: "Recommended"),
                            Gap(15),
                            CostumeText(
                              text: "Food paring",
                              color: AppColors.textColor,
                              fontSize: 12,
                            ),
                          ],
                        ),
                      ),
                      Gap(10),
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
