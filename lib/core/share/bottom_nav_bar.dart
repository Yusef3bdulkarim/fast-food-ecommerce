import 'package:ecommerce_app_food/core/utils/colors.dart';
import 'package:ecommerce_app_food/features/HomeScreens/logic/cubit/home_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomNavBar extends StatelessWidget {
  BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Container(
          height: 80.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(2.r),
              topRight: Radius.circular(50).r,
            ),
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.3),
                spreadRadius: 5.sp,
                blurRadius: 15.sp,
                offset: const Offset(-1, -2), // changes position of shadow
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(2.r),
              topRight: Radius.circular(50.r),
            ),
            child: BottomNavigationBar(
              currentIndex: context.watch<HomeCubit>().pageIndex,
              onTap: (value) {
                context.read<HomeCubit>().changePageIndex(value);
              },
              selectedItemColor: AppColors.mainColor,
              unselectedItemColor: Colors.grey.shade400,
              selectedFontSize: 14.sp,
              unselectedFontSize: 13.sp,

              type: BottomNavigationBarType.fixed,
              showUnselectedLabels: true,
              backgroundColor: Colors.white,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.home),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.archivebox_fill),
                  label: "Archive",
                ),
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.cart_fill),
                  label: "Cart",
                ),
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.person_fill),
                  label: "Profile",
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
