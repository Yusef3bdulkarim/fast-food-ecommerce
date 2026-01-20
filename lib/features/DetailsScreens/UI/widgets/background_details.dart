import 'package:ecommerce_app_food/core/utils/constans_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BackgroundDetails extends StatelessWidget {
  final dynamic product;
  const BackgroundDetails({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        height: 270.h,
        decoration: BoxDecoration(
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
