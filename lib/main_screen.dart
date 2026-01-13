import 'package:ecommerce_app_food/core/share/bottom_nav_bar.dart';
import 'package:ecommerce_app_food/features/CartScreens/UI/screens/cart_screen.dart';
import 'package:ecommerce_app_food/features/CartScreens/UI/screens/cart_screen_nav_bar.dart';
import 'package:ecommerce_app_food/features/HomeScreens/UI/screens/home_page.dart';
import 'package:ecommerce_app_food/features/HomeScreens/logic/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});
  static List<Widget> screens = [
    HomePage(),
    const Center(child: Text("archive")),
    CartScreenNavBar(),
    const Center(child: Text("Profile")),
  ];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        int currentIndex = context.watch<HomeCubit>().pageIndex;
        return Scaffold(
          body: IndexedStack(
            index: currentIndex,
            children: MainScreen.screens, // قائمة الصفحات بتاعتك
          ),
          bottomNavigationBar: BottomNavBar(),
        );
      },
    );
  }
}
