import 'package:ecommerce_app_food/core/utils/constans_app.dart';
import 'package:ecommerce_app_food/core/utils/costume_text.dart';
import 'package:ecommerce_app_food/core/share/header_icon.dart';
import 'package:ecommerce_app_food/core/utils/colors.dart';
import 'package:ecommerce_app_food/features/RecommendedScreen/logic/controller_ingredient.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class BackgroundIngrdient extends StatelessWidget {
  BackgroundIngrdient({super.key});
  var product = Get.find<ControllerRecommend>().product;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      toolbarHeight: 60,
      automaticallyImplyLeading: false,
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: HeaderIcon(icon: Icons.close),
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(40),
        child: Container(
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
          padding: EdgeInsets.only(top: 15, bottom: 5),

          child: Center(child: CostumeText(text: product.name.toString())),
        ),
      ),
      pinned: true,
      backgroundColor: AppColors.yellowColor,
      expandedHeight: 310,
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
