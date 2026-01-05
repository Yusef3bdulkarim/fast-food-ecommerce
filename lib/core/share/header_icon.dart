import 'package:ecommerce_app_food/core/routing/routing_helper.dart';
import 'package:ecommerce_app_food/core/utils/colors.dart';
import 'package:ecommerce_app_food/core/utils/constans_app.dart';
import 'package:ecommerce_app_food/features/CartScreens/logic/controller_carts.dart';
import 'package:ecommerce_app_food/features/HomeScreens/UI/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class HeaderIcon extends StatelessWidget {
  HeaderIcon({
    super.key,
    required this.icon,
    required this.isHomeIcons,
    this.background,
    this.colorIcons,
  });
  final IconData icon;
  bool isHomeIcons;
  Color? colorIcons;
  Color? background;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => Get.back(),
            child: Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                color: background ?? Color(0xFFfcf4e4),
                borderRadius: BorderRadius.circular(35),
              ),
              child: Center(
                child: Icon(
                  icon,
                  size: 15,
                  color: colorIcons ?? Color(0xff756d54),
                ),
              ),
            ),
          ),
          isHomeIcons ? Gap(0) : Gap(120),
          isHomeIcons
              ? Container()
              : GestureDetector(
                  // onTap: () => Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (_) => HomePage()),
                  // ),
                  child: Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      color: background ?? Color(0xFFfcf4e4),
                      borderRadius: BorderRadius.circular(35),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.home_outlined,
                        size: 18,
                        color: colorIcons ?? Color(0xff756d54),
                      ),
                    ),
                  ),
                ),

          GestureDetector(
            onTap: () => Get.toNamed(RoutingHelper.cartScreens),
            child: Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                color: background ?? Color(0xFFfcf4e4),
                borderRadius: BorderRadius.circular(35),
              ),
              child: Stack(
                children: [
                  // 1. الأيقونة الأساسية (أو الـ Container اللي شايل الأيقونة عندك)
                  Center(
                    child: Icon(
                      Icons.shopping_cart_outlined,
                      size: 20,
                      color:
                          colorIcons ?? Color(0xff756d54), // أو أي لون تستخدمه
                    ),
                  ),

                  // 2. الـ Badge (الدائرة اللي فوق)
                  GetBuilder<ControllerCarts>(
                    builder: (cartController) {
                      return cartController.totalItems >= 1
                          ? Positioned(
                              right: 0,
                              top: 0,
                              child: Container(
                                padding: const EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  color: AppColors
                                      .mainColor, // اللون البرتقالي أو الأخضر بتاعك
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                constraints: const BoxConstraints(
                                  minWidth: 16,
                                  minHeight: 16,
                                ),
                                child: Text(
                                  '${cartController.totalItems}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            )
                          : Container(); // لو السلة فاضية مش هيظهر حاجة
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
