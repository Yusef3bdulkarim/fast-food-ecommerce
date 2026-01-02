import 'package:ecommerce_app_food/core/utils/costume_text.dart';
import 'package:ecommerce_app_food/features/homeScreen/logic/controller_popularProduct.dart';
import 'package:ecommerce_app_food/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HeaderHomescreen extends StatelessWidget {
  const HeaderHomescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: 60,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CostumeText(text: "Bangladesh", color: AppColors.mainColor),
                Row(
                  children: [
                    CostumeText(
                      text: "Narshingdi",
                      color: AppColors.titleColor,
                      fontSize: 12,
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
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                      color: AppColors.mainColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(Icons.search, color: Colors.white, size: 25),
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
