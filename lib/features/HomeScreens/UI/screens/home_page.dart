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
class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<HomeCubit>().getData();
  }

  @override
  Widget build(BuildContext context) {
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
                  pinned: true,

                  floating: true,

                  snap: true,

                  expandedHeight: 45.h,

                  backgroundColor: Colors.white,

                  elevation: 0,

                  // shadowColor: AppColors.mainColor,
                  surfaceTintColor: Colors.white,
                  automaticallyImplyLeading: false,
                  title: Padding(
                    padding: EdgeInsets.only(top: 10.h, bottom: 15.h),
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
