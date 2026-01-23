import 'package:ecommerce_app_food/core/utils/colors.dart';
import 'package:ecommerce_app_food/core/utils/costume_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class BoxIsEmpty extends StatelessWidget {
  const BoxIsEmpty({
    super.key,
    this.img = "assets/image/empty_cart.png",
    required this.text,
    this.sizeImage = 210,
  });
  final String img;
  final String text;
  final double sizeImage;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(img, width: sizeImage.h, fit: BoxFit.cover),
        Gap(17.h),
        CostumeText(text: text, color: AppColors.textColor, fontSize: 15.sp),
      ],
    );
  }
}
