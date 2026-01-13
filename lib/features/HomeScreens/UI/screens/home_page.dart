import 'package:ecommerce_app_food/core/share/bottom_nav_bar.dart';
import 'package:ecommerce_app_food/core/utils/colors.dart';
import 'package:ecommerce_app_food/core/utils/costume_text.dart';
import 'package:ecommerce_app_food/features/HomeScreens/UI/widget/header_homeScreen.dart';
import 'package:ecommerce_app_food/features/HomeScreens/UI/widget/section_slide_card.dart';
import 'package:ecommerce_app_food/features/HomeScreens/UI/widget/slide_background.dart';
import 'package:ecommerce_app_food/features/HomeScreens/logic/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<HomeCubit>().getData();
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeLoadingState) {
            return Center(
              child: CircularProgressIndicator(color: AppColors.mainColor),
            );
          } else if (state is HomeSuccessState) {
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  // 1. التثبيت: خليه true عشان لما يختفي الهيدر يفضل فيه "خط" رفيع أو خلفية بيضاء تحمي منطقة الـ Status Bar
                  pinned: true,

                  // 2. الظهور التلقائي: خليه true عشان لو المستخدم سحب سحبة خفيفة لتحت يظهر له الهيدر تاني
                  floating: true,

                  snap: true,

                  // 3. الارتفاع: ده مجموع ارتفاع الهيدر بتاعك (تقريباً 100-120 بكسل)
                  expandedHeight: 45.h,

                  backgroundColor: Colors.white,

                  elevation: 0,

                  // shadowColor: AppColors.mainColor,
                  surfaceTintColor: Colors.white,
                  automaticallyImplyLeading: false,
                  title: Padding(
                    padding: EdgeInsets.only(
                      top: 10.h,
                      bottom: 15.h,
                    ), // تظبيط مكان الهيدر
                    child: HeaderHomescreen(),
                  ),
                  centerTitle: false,
                  titleSpacing: 0,
                ),
                SliverToBoxAdapter(
                  child: SlideBackground(
                    popularProducts: state.popularProducts,
                  ),
                ),

                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.h),
                    child: Row(
                      children: [
                        CostumeText(text: "Recommended"),
                        Gap(15.w),
                        CostumeText(
                          text: "Food paring",
                          color: AppColors.textColor,
                          fontSize: 12.sp,
                        ),
                      ],
                    ),
                  ),
                ),

                SectionSlideCard(
                  recommendedProducts: state.recommendedProducts,
                ),
              ],
            );
          } else if (state is HomeErrorState) {
            return Center(child: Text(state.message));
          }
          return Center(child: Text("Unexpected error occurred"));
        },
      ),
    );
  }
}
