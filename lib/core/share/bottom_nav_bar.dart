import 'package:ecommerce_app_food/core/utils/colors.dart';
import 'package:ecommerce_app_food/features/CartScreens/UI/screens/cart_screen.dart';
import 'package:ecommerce_app_food/features/HomeScreens/UI/screens/home_page.dart';
import 'package:ecommerce_app_food/features/HomeScreens/logic/cubit/home_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class BottomNavBar extends StatelessWidget {
  BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Container(
          height: 80,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(2),
              topRight: Radius.circular(50),
            ),
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.3),
                spreadRadius: 5,
                blurRadius: 15,
                offset: const Offset(-1, -2), // changes position of shadow
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(2),
              topRight: Radius.circular(50),
            ),
            child: BottomNavigationBar(
              currentIndex: context.watch<HomeCubit>().pageIndex,
              onTap: (value) {
                context.read<HomeCubit>().changePageIndex(value);
              },
              selectedItemColor: AppColors.mainColor,
              unselectedItemColor: Colors.grey.shade400,
              selectedFontSize: 14,
              unselectedFontSize: 13,

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

//  static late PersistentTabController controller;
// }
// @override
  // void dispose() {
  //   BottomNavBar.controller.dispose();
  //   super.dispose();
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   BottomNavBar.controller = PersistentTabController(initialIndex: 0);
  // }

  // List<Widget> _buildScreens() {
  //   return [
  //     HomePage(), // صفحة الهوم (الأكل)
  //     const Center(child: Text("archive")),
  //     const CartScreen(), // صفحة السلة
  //     const Center(child: Text("Profile")), // صفحة مؤقتة
  //   ];
  // }

  // List<PersistentBottomNavBarItem> _navBarsItems() {
  //   return [
  //     PersistentBottomNavBarItem(
  //       icon: const Icon(CupertinoIcons.home),
  //       title: ("Home"),
  //       activeColorPrimary: AppColors.mainColor,
  //       inactiveColorPrimary: CupertinoColors.systemGrey,
  //     ),
  //     PersistentBottomNavBarItem(
  //       icon: const Icon(CupertinoIcons.archivebox_fill),
  //       title: ("Archive"),
  //       activeColorPrimary: AppColors.mainColor,
  //       inactiveColorPrimary: CupertinoColors.systemGrey,
  //     ),
  //     PersistentBottomNavBarItem(
  //       icon: const Icon(CupertinoIcons.cart_fill),
  //       title: ("Cart"),
  //       activeColorPrimary: AppColors.mainColor,
  //       inactiveColorPrimary: CupertinoColors.systemGrey,
  //     ),
  //     PersistentBottomNavBarItem(
  //       icon: const Icon(CupertinoIcons.person_fill),
  //       title: ("Profile"),
  //       activeColorPrimary: AppColors.mainColor,
  //       inactiveColorPrimary: CupertinoColors.systemGrey,
  //     ),
  //   ];
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return PersistentTabView(
  //     context,
  //     controller: BottomNavBar.controller,
  //     screens: _buildScreens(),
  //     items: _navBarsItems(),

  //     handleAndroidBackButtonPress: true, // Default is true.
  //     resizeToAvoidBottomInset:
  //         true, // This needs to be true if you want to move up the screen on a non-scrollable screen when keyboard appears. Default is true.
  //     stateManagement: true, // Default is true.
  //     hideNavigationBarWhenKeyboardAppears: true,
  //     padding: const EdgeInsets.symmetric(vertical: 10),
  //     backgroundColor: const Color.fromARGB(
  //       255,
  //       245,
  //       245,
  //       245,
  //     ), // Default is Colors.white.
  //     isVisible: true,
  //     animationSettings: const NavBarAnimationSettings(
  //       navBarItemAnimation: ItemAnimationSettings(
  //         // Navigation Bar's items animation properties.
  //         duration: Duration(milliseconds: 400),
  //         curve: Curves.ease,
  //       ),
  //       screenTransitionAnimation: ScreenTransitionAnimationSettings(
  //         // Screen transition animation on change of selected tab.
  //         animateTabTransition: true,
  //         duration: Duration(milliseconds: 200),
  //         screenTransitionAnimationType: ScreenTransitionAnimationType.fadeIn,
  //       ),
  //     ),
  //     confineToSafeArea: true,
  //     navBarHeight: 70,
  //     navBarStyle: NavBarStyle.style1,

  //     // Choose the nav bar style with this property
  //   );
  // }