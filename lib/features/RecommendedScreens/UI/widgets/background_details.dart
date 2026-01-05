import 'package:ecommerce_app_food/core/utils/constans_app.dart';
import 'package:ecommerce_app_food/core/utils/costume_text.dart';
import 'package:ecommerce_app_food/core/share/header_icon.dart';
import 'package:ecommerce_app_food/core/utils/colors.dart';
import 'package:ecommerce_app_food/features/RecommendedScreens/logic/controller_ingredient.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class BackgroundIngrdient extends StatelessWidget {
  BackgroundIngrdient({super.key});
  var product = Get.find<ControllerRecommend>().product;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      toolbarHeight: 50.h,
      automaticallyImplyLeading: false,
      title: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: HeaderIcon(icon: Icons.close, isHomeIcons: true),
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(20.h),
        child: Container(
          width: double.maxFinite,
          padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.r),
              topRight: Radius.circular(25.r),
            ),
          ),

          child: Center(child: CostumeText(text: product.name.toString())),
        ),
      ),
      pinned: true,
      backgroundColor: AppColors.yellowColor,
      expandedHeight: 260.h,
      flexibleSpace: FlexibleSpaceBar(
        background: Image.network(
          ConstantsApp.baseUrl + ConstantsApp.uploades + product.img!,
          width: double.maxFinite,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
