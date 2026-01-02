import 'package:ecommerce_app_food/core/utils/colors.dart';
import 'package:ecommerce_app_food/core/utils/costume_text.dart';
import 'package:ecommerce_app_food/features/details/logic/controller_details.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class BarDetails extends StatelessWidget {
  BarDetails({super.key});
  final ControllerDetails _controller = Get.put(ControllerDetails());
  var product = Get.find<ControllerDetails>().product;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: const Color.fromARGB(73, 158, 158, 158),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Obx(() {
              return Container(
                height: 50,
                width: 90,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
                child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.start/,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () => _controller.minesIndex(),
                      child: Icon(
                        Icons.remove,
                        size: 15,
                        color: const Color.fromARGB(208, 0, 0, 0),
                      ),
                    ),
                    Gap(8),
                    CostumeText(
                      text: "${_controller.currentIndex.value}",
                      color: Colors.black,
                      fontSize: 16,
                    ),
                    Gap(8),
                    GestureDetector(
                      onTap: () => _controller.addIndex(),
                      child: Icon(
                        Icons.add,
                        size: 16,
                        color: const Color.fromARGB(202, 0, 0, 0),
                      ),
                    ),
                  ],
                ),
              );
            }),
            Container(
              height: 50,
              width: 170,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: AppColors.mainColor,
              ),
              child: Obx(() {
                return Center(
                  child: CostumeText(
                    text:
                        "${_controller.currentprice.value.toString()} | Add You Card",
                    color: Colors.white,
                    fontSize: 16,
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
