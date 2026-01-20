import 'package:ecommerce_app_food/features/CartScreens/UI/widgets/bottomBar_cart.dart';
import 'package:ecommerce_app_food/features/CartScreens/UI/widgets/header_cart.dart';
import 'package:ecommerce_app_food/features/CartScreens/UI/widgets/list_product_cart.dart';

import 'package:flutter/material.dart';

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
