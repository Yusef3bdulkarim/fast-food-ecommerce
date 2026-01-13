import 'package:ecommerce_app_food/core/utils/constans_app.dart';
import 'package:ecommerce_app_food/core/utils/costume_text.dart';
import 'package:ecommerce_app_food/core/share/section_icons.dart';
import 'package:ecommerce_app_food/core/utils/colors.dart';
import 'package:ecommerce_app_food/features/DetailsScreens/UI/screens/details_screen.dart';
import 'package:ecommerce_app_food/features/HomeScreens/logic/cubit/home_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class SlideBackground extends StatefulWidget {
  final List<dynamic> popularProducts;
  const SlideBackground({super.key, required this.popularProducts});

  @override
  State<SlideBackground> createState() => _SlideBackgroundState();
}

class _SlideBackgroundState extends State<SlideBackground> {
  late PageController _pageController;
  // 1. هنستخدم المتغير ده عشان نحدث الواجهة مع كل حركة صباع
  double _currPageValue = 0.0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.85, initialPage: 0);

    _pageController.addListener(() {
      setState(() {
        // 2. تحديث القيمة اللحظية للسكرول
        _currPageValue = _pageController.page!;
      });
      // تحديث الكيوبت عشان النقط (Dots)
      context.read<HomeCubit>().updatePageIndictor(_currPageValue);
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350.h,
      // 3. شلنا الـ BlocBuilder من هنا عشان نعتمد على الـ setState اللحظي للحركة
      child: PageView.builder(
        controller: _pageController,
        itemCount: widget.popularProducts.length,
        itemBuilder: (context, index) {
          return _buildPageItem(index);
        },
      ),
    );
  }

  Widget _buildPageItem(int index) {
    // 4. الحسبة السحرية للـ Scale والـ Translation
    Matrix4 matrix = Matrix4.identity();

    if (index == _currPageValue.floor()) {
      // الكارت الحالي
      double currScale = 1 - (_currPageValue - index) * (1 - 0.85);
      double currTrans = 350.h * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() + 1) {
      // الكارت التالي
      double currScale = 0.85 + (_currPageValue - index + 1) * (1 - 0.85);
      double currTrans = 350.h * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() - 1) {
      // الكارت السابق
      double currScale = 1 - (_currPageValue - index) * (1 - 0.85);
      double currTrans = 350.h * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      // الكروت البعيدة جداً
      double currScale = 0.85;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, 350.h * (1 - 0.85) / 2, 0);
    }

    return Transform(
      transform: matrix,
      child: Opacity(
        // الشفافية مرتبطة بالسكيل عشان المنظر يبقى احترافي
        opacity: (matrix.getRow(1)[1]).clamp(0.8, 1.0),
        child: GestureDetector(
          // جوه الـ onTap في صفحة الهوم
          onTap: () {
            Navigator.of(context, rootNavigator: true).push(
              MaterialPageRoute(
                builder: (context) =>
                    DetailsScreen(product: widget.popularProducts[index]),
              ),
            );
          },
          child: Center(
            child: Stack(
              children: [
                // خلفية الكارد
                Container(
                  height: 300.h,
                  width: 350.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                // الصورة
                Positioned(
                  child: Container(
                    height: 220.h,
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: 10.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.r),
                      image: DecorationImage(
                        image: NetworkImage(
                          "${ConstantsApp.baseUrl}uploads/${widget.popularProducts[index].img}",
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                // كارد المعلومات الأبيض
                Positioned(
                  bottom: 20.h,
                  left: 30.w,
                  right: 25.w,
                  child: _buildInfoCard(widget.popularProducts[index]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // الـ _buildInfoCard بتاعك يفضل زي ما هو
}

// Widget فرعي لتنظيم الكود (كارد المعلومات)
Widget _buildInfoCard(dynamic product) {
  return Container(
    height: 120.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25.r),
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: const Color(0xFFe8e8e8),
          blurRadius: 5.r,
          offset: Offset(0, 5.h),
        ),
      ],
    ),
    child: Padding(
      padding: EdgeInsets.only(top: 18.w, left: 15.h, right: 15.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CostumeText(text: product.name ?? ""),
          Gap(5.h),
          Row(
            children: [
              Wrap(
                children: List.generate(
                  (product.stars ?? 5).toInt().clamp(0, 5),
                  (index) =>
                      Icon(Icons.star, color: AppColors.mainColor, size: 15.sp),
                ),
              ),
              Gap(10.w),
              CostumeText(
                text: "4.5",
                fontSize: 12.sp,
                color: AppColors.textColor,
              ),
              Gap(10.w),
              CostumeText(
                text: "1287 comments",
                fontSize: 12.sp,
                color: AppColors.textColor,
              ),
            ],
          ),
          Gap(15.h),
          const SectionIcons(isGap: true),
        ],
      ),
    ),
  );
}
