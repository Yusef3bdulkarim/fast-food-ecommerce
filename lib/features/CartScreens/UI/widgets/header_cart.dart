import 'package:ecommerce_app_food/core/share/header_icon.dart';
import 'package:ecommerce_app_food/core/utils/colors.dart';
import 'package:flutter/material.dart';

class HeaderCart extends StatelessWidget {
  const HeaderCart({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      pinned: true,
      floating: true,
      backgroundColor: Colors.white,
      elevation: 0,
      surfaceTintColor: Colors.white,
      title: HeaderIcon(
        icon: Icons.arrow_back_ios_new_outlined,
        isHomeIcons: false,
        circleColor: Colors.white,
        cartIcons: false,
        background: AppColors.mainColor,
        colorIcons: Colors.white,
      ),
    );
    // استبدال GetBuilder بـ BlocBuilder
  }
}
