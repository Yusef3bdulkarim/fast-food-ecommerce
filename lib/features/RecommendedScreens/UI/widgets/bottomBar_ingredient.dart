import 'package:ecommerce_app_food/core/utils/costume_text.dart';
import 'package:ecommerce_app_food/core/utils/colors.dart';
import 'package:ecommerce_app_food/features/CartScreens/logic/cubit/cart_cubit.dart';
import 'package:ecommerce_app_food/features/DetailsScreens/logic/cubit/product_details_cubit.dart'
    show ProductDetailsCubit;
import 'package:ecommerce_app_food/features/RecommendedScreens/logic/cubit/recommended_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

// ignore: must_be_immutable
class BottombarIngredient extends StatelessWidget {
  final dynamic product;
  BottombarIngredient({super.key, this.product});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecommendedCubit, RecommendedState>(
      builder: (context, state) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () =>
                        context.read<RecommendedCubit>().setQuantity(false),
                    child: Container(
                      height: 40.h,
                      width: 40.h,
                      decoration: BoxDecoration(
                        color: AppColors.mainColor,
                        borderRadius: BorderRadius.circular(40.r),
                      ),
                      child: Icon(
                        Icons.remove,
                        size: 20.sp,
                        color: Colors.white,
                      ),
                    ),
                  ),

                  Gap(20.h),

                  CostumeText(
                    text: "\$${product.price} X ${state.quantity.toInt()}",
                    color: Colors.black,
                    fontSize: 16.sp,
                  ),
                  Gap(20.h),

                  GestureDetector(
                    onTap: () =>
                        context.read<RecommendedCubit>().setQuantity(true),

                    child: Container(
                      height: 40.h,
                      width: 40.w,
                      decoration: BoxDecoration(
                        color: AppColors.mainColor,
                        borderRadius: BorderRadius.circular(40.r),
                      ),
                      child: Icon(Icons.add, size: 20.sp, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10.h),
              height: 90.h,
              decoration: BoxDecoration(
                color: const Color.fromARGB(73, 158, 158, 158),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.r),
                  topRight: Radius.circular(30.r),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () =>
                          context.read<RecommendedCubit>().toggleExpand(),
                      child: Container(
                        height: 55.h,
                        width: 55.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.r),
                          color: Colors.white,
                        ),
                        child: Icon(
                          Icons.favorite,
                          color: state.isToggle
                              ? AppColors.mainColor
                              : Colors.grey,
                        ),
                      ),
                    ),

                    GestureDetector(
                      onTap: () {
                        context.read<CartCubit>().addItems(
                          product,
                          state.quantity.toInt(),
                        );
                      },
                      child: Container(
                        height: 47.h,
                        width: 170.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.r),
                          color: AppColors.mainColor,
                        ),
                        child: Center(
                          child: BlocBuilder<RecommendedCubit, RecommendedState>(
                            builder: (context, state) {
                              return CostumeText(
                                text:
                                    "\$ ${product.price * state.quantity.toInt()} Add to cart",
                                color: Colors.white,
                                fontSize: 16.sp,
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
