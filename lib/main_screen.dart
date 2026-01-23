import 'package:ecommerce_app_food/core/share/bottom_nav_bar.dart';
import 'package:ecommerce_app_food/features/CartScreens/UI/screens/cart_screen_History.dart';
import 'package:ecommerce_app_food/features/HomeScreens/UI/screens/home_page.dart';
import 'package:ecommerce_app_food/features/HomeScreens/logic/cubit/home_cubit.dart';
import 'package:ecommerce_app_food/features/auth/UI/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});
  static List<Widget> screens = [
    HomePage(),
    // const Center(child: Text("archive")),
    CartScreenNavBar(),
    const ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        // int currentIndex = context.watch<HomeCubit>().pageIndex;
        int currentIndex = 0;
        if (state is HomeSuccessState) {
          currentIndex = state.pageIndex;
        } else {
          currentIndex = context.read<HomeCubit>().pageIndex;
        }
        return Scaffold(
          backgroundColor: Colors.transparent,
          extendBody: true,
          body: IndexedStack(index: currentIndex, children: MainScreen.screens),
          bottomNavigationBar: BottomNavBar(),
        );
      },
    );
  }
}
