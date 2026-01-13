import 'package:ecommerce_app_food/features/HomeScreens/data/models/model_foodApp.dart';
import 'package:ecommerce_app_food/features/RecommendedScreens/logic/cubit/recommended_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce_app_food/features/RecommendedScreens/UI/widgets/background_details.dart';
import 'package:ecommerce_app_food/features/RecommendedScreens/UI/widgets/bottomBar_ingredient.dart';
import 'package:ecommerce_app_food/features/RecommendedScreens/UI/widgets/cont_details.dart';

class IngredientScreen extends StatelessWidget {
  // 1. استلام الموديل بالكامل بدلاً من الـ ID
  final ProductModel product;

  const IngredientScreen({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 2. مفيش داعي لعمل watch للـ HomeCubit هنا
    return BlocProvider(
      create: (context) =>
          RecommendedCubit()..initProduct((product.price ?? 0).toDouble()),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: [
            // 3. تمرير الموديل للـ Widgets الفرعية
            BackgroundIngrdient(product: product),
            SliverToBoxAdapter(child: ContIngredient(product: product)),
          ],
        ),
        bottomNavigationBar: BottombarIngredient(product: product),
      ),
    );
  }
}
