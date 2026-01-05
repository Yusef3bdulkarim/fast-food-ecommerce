// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecommerce_app_food/features/CartScreens/logic/controller_carts.dart';
import 'package:ecommerce_app_food/features/HomeScreens/logic/controller_popularProduct.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ecommerce_app_food/core/share/header_icon.dart';
import 'package:ecommerce_app_food/features/DetailsScreens/UI/widgets/background_details.dart';
import 'package:ecommerce_app_food/features/DetailsScreens/UI/widgets/bottomBar_details.dart';
import 'package:ecommerce_app_food/features/DetailsScreens/UI/widgets/cont_details.dart';
import 'package:ecommerce_app_food/features/DetailsScreens/logic/controller_details.dart';

// ignore: must_be_immutable
class DetailsScreen extends StatelessWidget {
  int idPopular;
  DetailsScreen({Key? key, required this.idPopular}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var product = Get.find<ControllerFood>().newList[idPopular];

    var product = Get.isRegistered<ControllerFood>()
        ? Get.find<ControllerFood>().newList[idPopular]
        : Get.put(
            ControllerFood(repoPopularproduct: Get.find()).newList[idPopular],
          );
    var cartController = Get.find<ControllerCarts>();
    Get.put(ControllerDetails()).initProduct(product, cartController);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          BackgroundDetails(),
          Positioned(
            left: 20.w,
            right: 20.w,
            top: 35.h,
            child: HeaderIcon(
              icon: Icons.arrow_back_ios_new_outlined,
              isHomeIcons: true,
            ),
          ),
          ContDetails(),
        ],
      ),

      bottomNavigationBar: BarDetails(),
    );
  }
}
