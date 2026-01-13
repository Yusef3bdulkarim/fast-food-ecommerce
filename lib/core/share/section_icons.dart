import 'package:ecommerce_app_food/core/utils/costume_text.dart';
import 'package:ecommerce_app_food/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class SectionIcons extends StatelessWidget {
  const SectionIcons({super.key, this.sizeIcons = 20, this.isGap = false});
  final double sizeIcons;
  final bool isGap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(
              Icons.circle_rounded,
              size: sizeIcons,
              color: AppColors.iconColor1,
            ),
            CostumeText(
              text: "Normal",
              fontSize: 12.sp,
              color: AppColors.textColor,
            ),
          ],
        ),
        Row(
          children: [
            Icon(
              Icons.location_on,
              size: sizeIcons,
              color: AppColors.mainColor,
            ),
            CostumeText(
              text: "1.7km",
              fontSize: 12.sp,
              color: AppColors.textColor,
            ),
          ],
        ),
        Row(
          children: [
            Icon(
              Icons.access_time,
              size: sizeIcons,
              color: AppColors.iconColor2,
            ),
            CostumeText(
              text: " 32min",
              fontSize: 12.sp,
              color: AppColors.textColor,
            ),
            isGap ? Gap(20.h) : Gap(0.h),
          ],
        ),
      ],
    );
  }
}
