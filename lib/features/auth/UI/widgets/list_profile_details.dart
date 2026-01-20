import 'package:ecommerce_app_food/core/utils/colors.dart';
import 'package:ecommerce_app_food/core/utils/costume_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ListProfileDetails extends StatelessWidget {
  const ListProfileDetails({
    super.key,
    required this.circleBackground,
    required this.title,
    required this.icon,
  });
  final Color circleBackground;
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Column(
        children: [
          Gap(20.h),
          Container(
            height: 55.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.r),
              boxShadow: [
                BoxShadow(
                  color: AppColors.textColor,
                  spreadRadius: 0.9.sp,
                  blurRadius: 5.sp,
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Row(
                children: [
                  Container(
                    height: 40.h,
                    width: 40.w,
                    decoration: BoxDecoration(
                      color: circleBackground,
                      borderRadius: BorderRadius.circular(100.r),
                    ),
                    child: Icon(icon, size: 25.sp, color: Colors.white),
                  ),
                  Gap(15.w),
                  Container(
                    width: 250,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: CostumeText(
                        text: title,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.mainBlackColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
