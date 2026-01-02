import 'package:ecommerce_app_food/core/utils/colors.dart';
import 'package:ecommerce_app_food/features/RecommendedScreen/logic/controller_ingredient.dart';
import 'package:ecommerce_app_food/features/details/logic/controller_details.dart';
import 'package:flutter/material.dart';
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
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
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
              style: TextStyle(color: AppColors.titleColor, fontSize: 15),
            ),

            Gap(4),
            GestureDetector(
              onTap: () => _controller.toggleText(),
              child: Row(
                children: [
                  Text(
                    _controller.isExpand.value ? "See Less " : "See more",
                    style: TextStyle(
                      color: AppColors.mainColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(
                    _controller.isExpand.value
                        ? Icons.arrow_drop_up
                        : Icons.arrow_drop_down,
                    size: 22,
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
