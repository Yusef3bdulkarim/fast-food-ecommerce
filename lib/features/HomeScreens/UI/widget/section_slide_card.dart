import 'package:ecommerce_app_food/core/utils/constans_app.dart';
import 'package:ecommerce_app_food/core/utils/costume_text.dart';
import 'package:ecommerce_app_food/core/share/section_icons.dart';
import 'package:ecommerce_app_food/core/utils/colors.dart';
import 'package:ecommerce_app_food/features/RecommendedScreens/UI/screens/ingredient_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class SectionSlideCard extends StatelessWidget {
  final List<dynamic> recommendedProducts;
  const SectionSlideCard({super.key, required this.recommendedProducts});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 10.h),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context, rootNavigator: true).push(
                    MaterialPageRoute(
                      builder: (context) =>
                          IngredientScreen(product: recommendedProducts[index]),
                    ),
                  );
                },
                child: Container(
                  height: 95.h,
                  width: 95.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: NetworkImage(
                        "${ConstantsApp.baseUrl + ConstantsApp.uploades + recommendedProducts[index].img}",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              Expanded(
                child: Container(
                  height: 88.h,

                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20.r),
                      bottomRight: Radius.circular(20.r),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFFe8e8e8),
                        blurRadius: 5,
                        offset: Offset(2, 2),
                      ),
                      BoxShadow(
                        color: Colors.white,
                        blurRadius: 5,
                        offset: Offset(0, -5),
                      ),
                      BoxShadow(
                        color: Color(0xFFe8e8e8),
                        blurRadius: 5,
                        offset: Offset(-2, 0),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 7.w,
                      vertical: 7.h,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CostumeText(
                          text: recommendedProducts[index].name ?? "",
                          fontSize: 16.sp,
                        ),
                        CostumeText(
                          text: "with chineso charactreistics ",
                          fontSize: 13.sp,
                          color: AppColors.textColor,
                        ),
                        Gap(6.h),
                        SectionIcons(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }, childCount: recommendedProducts.length),
    );
  }
}
