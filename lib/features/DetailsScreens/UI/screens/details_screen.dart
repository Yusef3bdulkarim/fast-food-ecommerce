import 'package:ecommerce_app_food/features/DetailsScreens/logic/cubit/product_details_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce_app_food/core/share/header_icon.dart';
import 'package:ecommerce_app_food/features/DetailsScreens/UI/widgets/background_details.dart';
import 'package:ecommerce_app_food/features/DetailsScreens/UI/widgets/bottomBar_details.dart';
import 'package:ecommerce_app_food/features/DetailsScreens/UI/widgets/cont_details.dart';

class DetailsScreen extends StatelessWidget {
  final dynamic product; // استقبل المنتج نفسه مش الـ ID
  const DetailsScreen({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // استخدمنا ?? 0.0 عشان نضمن إن السعر لو نل التطبيق ما يقعش
      create: (context) =>
          ProductDetailsCubit()..initProduct((product.price ?? 0).toDouble()),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            BackgroundDetails(product: product),
            Positioned(
              left: 20.w,
              right: 20.w,
              top: 35.h,
              child: const HeaderIcon(
                icon: Icons.arrow_back_ios_new_outlined,
                isHomeIcons: true,
              ),
            ),
            ContDetails(product: product),
          ],
        ),
        bottomNavigationBar: BarDetails(product: product),
      ),
    );
  }
}
