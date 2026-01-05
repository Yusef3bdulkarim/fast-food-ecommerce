import 'package:ecommerce_app_food/core/utils/colors.dart';
import 'package:ecommerce_app_food/core/utils/costume_text.dart';
import 'package:ecommerce_app_food/features/CartScreens/logic/controller_carts.dart';
import 'package:ecommerce_app_food/features/DetailsScreens/logic/controller_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class BarDetails extends StatelessWidget {
  BarDetails({super.key});
  final ControllerDetails _controller = Get.put(ControllerDetails());
  var product = Get.find<ControllerDetails>().product;
  final ControllerCarts cartController = Get.find<ControllerCarts>();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.h,
      decoration: BoxDecoration(
        color: const Color.fromARGB(73, 158, 158, 158),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.r),
          topRight: Radius.circular(30.r),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Obx(() {
              return Container(
                height: 45.h,
                width: 85.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
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
                        size: 15.sp,
                        color: const Color.fromARGB(208, 0, 0, 0),
                      ),
                    ),
                    Gap(8.h),
                    CostumeText(
                      text: "${_controller.currentIndex.value}",
                      color: Colors.black,
                      fontSize: 15.sp,
                    ),
                    Gap(8.h),
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
            GestureDetector(
              onTap: () {
                cartController.addItems(
                  product,
                  _controller.currentIndex.value,
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
                height: 45.h,
                width: 165.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  color: AppColors.mainColor,
                ),
                child: Obx(() {
                  return Center(
                    child: CostumeText(
                      text:
                          "${_controller.currentprice.value.toString()} | Add You Card",
                      color: Colors.white,
                      fontSize: 15.sp,
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
