import 'package:ecommerce_app_food/core/utils/constans_app.dart';
import 'package:ecommerce_app_food/features/DetailsScreens/logic/controller_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

// ignore: must_be_immutable
class BackgroundDetails extends StatelessWidget {
  BackgroundDetails({super.key});
  var product = Get.find<ControllerDetails>().product;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: Container(
        height: 390.h,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 62, 53, 53),
          borderRadius: BorderRadius.circular(12.r),
          image: DecorationImage(
            image: NetworkImage(
              ConstantsApp.baseUrl + ConstantsApp.uploades + product.img!,
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
