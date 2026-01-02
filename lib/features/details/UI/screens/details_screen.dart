// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecommerce_app_food/features/homeScreen/logic/controller_popularProduct.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce_app_food/core/share/header_icon.dart';
import 'package:ecommerce_app_food/features/details/UI/widgets/background_details.dart';
import 'package:ecommerce_app_food/features/details/UI/widgets/bottomBar_details.dart';
import 'package:ecommerce_app_food/features/details/UI/widgets/cont_details.dart';
import 'package:ecommerce_app_food/features/details/logic/controller_details.dart';

// ignore: must_be_immutable
class DetailsScreen extends StatelessWidget {
  int idPopular;
  DetailsScreen({Key? key, required this.idPopular}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product = Get.find<ControllerFood>().newList[idPopular];
    Get.put(ControllerDetails()).initProduct(product);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          BackgroundDetails(),
          Positioned(
            left: 20,
            right: 20,
            top: 35,
            child: HeaderIcon(icon: Icons.arrow_back_ios_new_outlined),
          ),
          ContDetails(),
        ],
      ),

      bottomNavigationBar: BarDetails(),
    );
  }
}
