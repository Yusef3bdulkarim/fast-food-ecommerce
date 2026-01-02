import 'package:ecommerce_app_food/core/utils/costume_text.dart';
import 'package:ecommerce_app_food/core/share/section_icons.dart';
import 'package:ecommerce_app_food/core/utils/colors.dart';
import 'package:ecommerce_app_food/features/details/logic/controller_details.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';

// ignore: must_be_immutable
class ContDetails extends StatelessWidget {
  ContDetails({super.key});
  ControllerDetails _controller = Get.put(ControllerDetails());
  var product = Get.find<ControllerDetails>().product;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentGeometry.bottomCenter,
      child: Container(
        height: 415,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CostumeText(text: product.name.toString()),
              Gap(7),
              Row(
                children: [
                  Wrap(
                    children: List.generate(
                      product.stars ?? 1,
                      (index) => Icon(
                        Icons.star,
                        color: AppColors.mainColor,
                        size: 18,
                      ),
                    ),
                  ),
                  Gap(10),
                  CostumeText(
                    text: "4.5",
                    fontSize: 14,
                    color: AppColors.textColor,
                  ),
                  Gap(10),
                  CostumeText(
                    text: "1287 comments",
                    fontSize: 14,
                    color: AppColors.textColor,
                  ),
                ],
              ),
              Gap(15),
              SectionIcons(sizeIcons: 25, isGap: true),

              Gap(15),
              CostumeText(text: "Introduce"),
              Gap(5),
              Obx(() {
                return SizedBox(
                  height: 220,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.description.toString(),
                          maxLines: _controller.isExpand.value ? null : 3,
                          overflow: _controller.isExpand.value
                              ? TextOverflow.visible
                              : TextOverflow.ellipsis,
                          style: TextStyle(
                            color: AppColors.titleColor,
                            fontSize: 14,
                          ),
                        ),
                        Gap(4),
                        GestureDetector(
                          onTap: () => _controller.toggleText(),
                          child: Row(
                            children: [
                              Text(
                                _controller.isExpand.value
                                    ? "See Less "
                                    : "See more",
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
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
