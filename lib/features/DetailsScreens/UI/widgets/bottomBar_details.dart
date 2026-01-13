import 'package:ecommerce_app_food/features/CartScreens/logic/cubit/cart_cubit.dart';
import 'package:ecommerce_app_food/features/DetailsScreens/logic/cubit/product_details_cubit.dart';
import 'package:ecommerce_app_food/features/HomeScreens/data/models/model_foodApp.dart';
import 'package:ecommerce_app_food/core/utils/colors.dart';
import 'package:ecommerce_app_food/core/utils/costume_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class BarDetails extends StatelessWidget {
  final ProductModel product;
  BarDetails({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
      builder: (context, state) {
        return Container(
          height: 90.h,
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          decoration: BoxDecoration(
            color: const Color.fromARGB(73, 158, 158, 158),
            borderRadius: BorderRadius.vertical(top: Radius.circular(30.r)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // العداد
              Container(
                padding: EdgeInsets.all(10.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.r),
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => context
                          .read<ProductDetailsCubit>()
                          .setQuantity(false),
                      child: Icon(Icons.remove, size: 18.sp),
                    ),
                    Gap(10.w),
                    CostumeText(text: "${state.quantity}", color: Colors.black),
                    Gap(10.w),
                    GestureDetector(
                      onTap: () =>
                          context.read<ProductDetailsCubit>().setQuantity(true),
                      child: Icon(Icons.add, size: 18.sp),
                    ),
                  ],
                ),
              ),
              // زر الإضافة
              GestureDetector(
                onTap: () {
                  if (state.quantity > 0) {
                    // بنبعت الـ product والكمية اللي في الـ state للـ CartCubit
                    context.read<CartCubit>().addItems(product, state.quantity);
                  } else {
                    Get.snackbar(
                      "Warning",
                      "Quantity must be more than 0",
                      backgroundColor: Colors.amber,
                      colorText: Colors.white,
                    );
                  }
                },
                child: Container(
                  padding: EdgeInsets.all(15.w),
                  decoration: BoxDecoration(
                    color: AppColors.mainColor,
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  child: CostumeText(
                    text:
                        "\$${state.totalPrice * state.quantity} | Add to Cart",
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
