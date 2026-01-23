import 'package:ecommerce_app_food/core/utils/colors.dart';
import 'package:ecommerce_app_food/features/HomeScreens/logic/cubit/home_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavBar extends StatelessWidget {
  BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),

          // بيخليه طاير
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30.r), // زوايا دائرية بالكامل
            boxShadow: [
              BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1)),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 8.h),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: AppColors.mainColor, // لونك المفضل
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
              duration: Duration(milliseconds: 400),
              tabBackgroundColor: AppColors.mainColor.withOpacity(
                0.1,
              ), // خلفية خفيفة عند الاختيار
              color: const Color.fromARGB(127, 20, 18, 18),
              tabs: const [
                GButton(icon: CupertinoIcons.home, text: 'Home'),
                GButton(icon: CupertinoIcons.cart_fill, text: 'Cart'),
                GButton(icon: CupertinoIcons.person_fill, text: 'Profile'),
              ],
              selectedIndex: context.read<HomeCubit>().pageIndex,
              onTabChange: (index) {
                context.read<HomeCubit>().changePageIndex(index);
              },
            ),
          ),
        );
      },
    );
  }
}
