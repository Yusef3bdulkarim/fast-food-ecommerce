import 'package:ecommerce_app_food/core/share/header_icon.dart';
import 'package:ecommerce_app_food/core/utils/colors.dart';
import 'package:ecommerce_app_food/core/utils/constans_app.dart';
import 'package:ecommerce_app_food/core/utils/costume_text.dart';
import 'package:ecommerce_app_food/features/CartScreens/UI/widgets/bottomBar_cart.dart';
import 'package:ecommerce_app_food/features/CartScreens/UI/widgets/header_cart.dart';
import 'package:ecommerce_app_food/features/CartScreens/UI/widgets/list_product_cart.dart';
// استيراد الكيوبت الجديد
import 'package:ecommerce_app_food/features/CartScreens/logic/cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // مكتبة الـ Bloc
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(slivers: [HeaderCart(), ListProductCart()]),
      bottomNavigationBar: BottombarCart(),
    );
  }
}
