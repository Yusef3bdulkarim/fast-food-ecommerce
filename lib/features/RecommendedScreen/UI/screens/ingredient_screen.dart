import 'package:ecommerce_app_food/features/RecommendedScreen/logic/controller_ingredient.dart';
import 'package:ecommerce_app_food/features/homeScreen/logic/controller_recommend.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce_app_food/features/RecommendedScreen/UI/widgets/background_details.dart';
import 'package:ecommerce_app_food/features/RecommendedScreen/UI/widgets/bottomBar_ingredient.dart';
import 'package:ecommerce_app_food/features/RecommendedScreen/UI/widgets/cont_details.dart';

// ignore: must_be_immutable
class IngredientScreen extends StatelessWidget {
  int idPopular;
  IngredientScreen({Key? key, required this.idPopular}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var product = Get.find<ControllerRecommended>().newList[idPopular];
    Get.put(ControllerRecommend()).initRecommended(product);
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          BackgroundIngrdient(),
          SliverToBoxAdapter(child: ContIngredient()),
        ],
      ),
      bottomNavigationBar: BottombarIngredient(),
    );
  }
}
