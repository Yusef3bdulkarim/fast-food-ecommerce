import 'package:ecommerce_app_food/core/utils/costume_text.dart';
import 'package:ecommerce_app_food/core/utils/colors.dart';
import 'package:ecommerce_app_food/features/RecommendedScreen/logic/controller_ingredient.dart';
import 'package:ecommerce_app_food/features/RecommendedScreen/UI/widgets/section_icons_ingredienr.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class BottombarIngredient extends StatelessWidget {
  BottombarIngredient({super.key});
  ControllerRecommend _controller = Get.put(ControllerRecommend());
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SectionIconsIngredienr(),
        Container(
          margin: EdgeInsets.only(top: 10),
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
                  return GestureDetector(
                    onTap: () => _controller.toggleIcons(),
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      child: Icon(
                        Icons.favorite,
                        color: _controller.isEnterIcon.value
                            ? AppColors.mainColor
                            : Colors.grey,
                      ),
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
                  child: Center(
                    child: Obx(() {
                      return CostumeText(
                        text:
                            "\$ ${_controller.currentPrice.value} Add to cart",
                        color: Colors.white,
                        fontSize: 16,
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
