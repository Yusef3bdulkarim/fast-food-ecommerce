import 'package:ecommerce_app_food/core/routing/routing_helper.dart';
import 'package:ecommerce_app_food/core/utils/colors.dart';
import 'package:ecommerce_app_food/features/CartScreens/logic/cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HeaderIcon extends StatelessWidget {
  final IconData icon;
  final bool isHomeIcons;
  final Color? colorIcons;
  final Color? background;
  final Color? circleColor;
  final bool cartIcons;
  const HeaderIcon({
    super.key,
    required this.icon,
    required this.isHomeIcons,
    this.background,
    this.colorIcons,
    this.circleColor,
    this.cartIcons = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // زر الرجوع
          _buildCircleIcon(
            icon: icon,
            onTap: () => Navigator.pop(context), // استبدال Get.back()
          ),

          // زر الصفحة الرئيسية (يظهر فقط لو مش في الـ Home)
          if (!isHomeIcons)
            _buildCircleIcon(
              icon: Icons.home_outlined,
              onTap: () {
                Navigator.pushNamed(
                  context,
                  RoutingHelper.initial,
                  // (route) => false,
                );

                // لزيادة التأكيد إننا واقفين على أول تاب (الهوم)
              },
            ),

          // أيقونة السلة مع الـ Badge
          GestureDetector(
            onTap: () => Navigator.pushNamed(
              context,
              RoutingHelper.cart,
            ), // استبدال Get.toNamed
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                cartIcons
                    ? _buildCircleIcon(icon: Icons.shopping_cart_outlined)
                    : _buildCircleIcon(icon: Icons.shopping_cart),

                // هنا هنستخدم BlocBuilder بدل GetBuilder للسلة
                // ملحوظة: لو لسه معملتش CartCubit سيبها مؤقتاً أو استبدلها بـ BlocBuilder
                cartIcons
                    ? BlocBuilder<CartCubit, CartState>(
                        builder: (context, state) {
                          int total = context
                              .read<CartCubit>()
                              .totalItems; // افترض إن عندك totalItems في الحالة
                          return total > 0
                              ? Positioned(
                                  right: 2,
                                  top: 0,
                                  child: Container(
                                    padding: const EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                      color: circleColor ?? AppColors.mainColor,
                                      shape: BoxShape.circle,
                                    ),
                                    constraints: const BoxConstraints(
                                      minWidth: 18,
                                      minHeight: 18,
                                    ),
                                    child: Text(
                                      '${total}', // استبدل '3' بـ state.totalItems لاحقاً
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                )
                              : SizedBox.shrink();
                        },
                      )
                    : SizedBox(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget مساعد عشان م نكررش كود الدائرة كتير
  Widget _buildCircleIcon({required IconData icon, VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          color: background ?? const Color(0xFFfcf4e4),
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          size: 18,
          color: colorIcons ?? const Color(0xff756d54),
        ),
      ),
    );
  }
}
