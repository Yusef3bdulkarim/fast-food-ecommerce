import 'package:ecommerce_app_food/core/utils/colors.dart';
import 'package:ecommerce_app_food/features/RecommendedScreens/logic/controller_ingredient.dart';
import 'package:ecommerce_app_food/features/DetailsScreens/logic/controller_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';

// ignore: must_be_immutable
class ContIngredient extends StatelessWidget {
  ContIngredient({super.key});
  ControllerDetails _controller = Get.put(ControllerDetails());
  var product = Get.find<ControllerRecommend>().product;
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 12.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              product.description.toString(),
              maxLines: _controller.isExpand.value ? null : 7,
              overflow: _controller.isExpand.value
                  ? TextOverflow.visible
                  : TextOverflow.ellipsis,
              style: TextStyle(color: AppColors.titleColor, fontSize: 15.sp),
            ),

            Gap(4.h),
            GestureDetector(
              onTap: () => _controller.toggleText(),
              child: Row(
                children: [
                  Text(
                    _controller.isExpand.value ? "See Less " : "See more",
                    style: TextStyle(
                      color: AppColors.mainColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(
                    _controller.isExpand.value
                        ? Icons.arrow_drop_up
                        : Icons.arrow_drop_down,
                    size: 22.sp,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
