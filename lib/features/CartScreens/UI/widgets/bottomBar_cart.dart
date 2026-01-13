import 'package:ecommerce_app_food/core/utils/costume_text.dart';
import 'package:ecommerce_app_food/core/utils/colors.dart';
import 'package:ecommerce_app_food/features/CartScreens/logic/cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottombarCart extends StatelessWidget {
  BottombarCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
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
                Container(
                  height: 47.h,
                  width: 150.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    color: Colors.white,
                  ),
                  child: BlocBuilder<CartCubit, CartState>(
                    builder: (context, state) {
                      return Center(
                        child: CostumeText(
                          text:
                              "Total Price : ${context.read<CartCubit>().totalAmount}",
                          color: Colors.redAccent,
                          fontSize: 16.sp,
                        ),
                      );
                    },
                  ),
                ),

                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 47.h,
                    width: 120.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(17.r),
                      color: AppColors.mainColor,
                    ),
                    child: Center(
                      child: CostumeText(
                        text: "Check Out",
                        color: Colors.white,
                        fontSize: 16.sp,
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
  }
}
