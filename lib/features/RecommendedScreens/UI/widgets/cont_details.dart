import 'package:ecommerce_app_food/core/utils/colors.dart';
import 'package:ecommerce_app_food/features/RecommendedScreens/logic/cubit/recommended_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

// ignore: must_be_immutable
class ContIngredient extends StatelessWidget {
  final dynamic product;
  ContIngredient({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecommendedCubit, RecommendedState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 12.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                product.description.toString(),
                maxLines: state.isExpand ? null : 7,
                overflow: state.isExpand
                    ? TextOverflow.visible
                    : TextOverflow.ellipsis,
                style: TextStyle(color: AppColors.titleColor, fontSize: 15.sp),
              ),

              Gap(4.h),
              GestureDetector(
                onTap: () => context.read<RecommendedCubit>().isToggleExpand(),
                child: Row(
                  children: [
                    Text(
                      state.isExpand ? "See Less " : "See more",
                      style: TextStyle(
                        color: AppColors.mainColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(
                      state.isExpand
                          ? Icons.arrow_drop_up
                          : Icons.arrow_drop_down,
                      size: 22.sp,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
