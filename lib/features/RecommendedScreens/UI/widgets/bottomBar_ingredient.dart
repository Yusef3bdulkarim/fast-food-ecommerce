import 'package:ecommerce_app_food/core/utils/costume_text.dart';
import 'package:ecommerce_app_food/core/utils/colors.dart';
import 'package:ecommerce_app_food/features/CartScreens/logic/controller_carts.dart';
import 'package:ecommerce_app_food/features/DetailsScreens/logic/controller_details.dart';
import 'package:ecommerce_app_food/features/RecommendedScreens/logic/controller_ingredient.dart';
import 'package:ecommerce_app_food/features/RecommendedScreens/UI/widgets/section_icons_ingredienr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class BottombarIngredient extends StatelessWidget {
  BottombarIngredient({super.key});
  ControllerRecommend _controller = Get.put(ControllerRecommend());

  final ControllerRecommend controller = Get.put(ControllerRecommend());
  var product = Get.find<ControllerRecommend>().product;
  final ControllerCarts cartController = Get.find<ControllerCarts>();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SectionIconsIngredienr(),
        Container(
          margin: EdgeInsets.only(top: 10.h),
          height: 90.h,
          decoration: BoxDecoration(
            color: const Color.fromARGB(73, 158, 158, 158),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.r),
              topRight: Radius.circular(30.r),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(() {
                  return GestureDetector(
                    onTap: () => _controller.toggleIcons(),
                    child: Container(
                      height: 55.h,
                      width: 55.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.r),
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
                GestureDetector(
                  onTap: () {
                    cartController.addItems(
                      product,
                      controller.currentIndex.value,
                    );

                    Get.snackbar(
                      "Cart",
                      "Added to cart successfully!",
                      backgroundColor: AppColors.OrangeColor,
                      colorText: Colors.white,
                      snackPosition: SnackPosition.TOP,
                    );
                  },
                  child: Container(
                    height: 47.h,
                    width: 170.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                      color: AppColors.mainColor,
                    ),
                    child: Center(
                      child: Obx(() {
                        return CostumeText(
                          text:
                              "\$ ${_controller.currentPrice.value} Add to cart",
                          color: Colors.white,
                          fontSize: 16.sp,
                        );
                      }),
                    ),
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
