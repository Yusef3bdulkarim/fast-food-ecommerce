import 'package:ecommerce_app_food/core/utils/colors.dart';
import 'package:ecommerce_app_food/core/utils/costume_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ImageProfile extends StatelessWidget {
  const ImageProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Center(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 20.h),
              height: 120.h,
              width: 120.h,
              decoration: BoxDecoration(
                color: AppColors.mainColor,
                borderRadius: BorderRadius.circular(150.r),
                // image: DecorationImage(
                //   fit: BoxFit.cover,
                //   image: AssetImage("assets/image/user.png"),
                // ),
              ),
              child: Icon(Icons.person, color: Colors.white, size: 70.sp),
            ),
            Gap(10.h),
            CostumeText(
              text: "Edit",
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.OrangeColor,
            ),
          ],
        ),
      ),
    );
  }
}
