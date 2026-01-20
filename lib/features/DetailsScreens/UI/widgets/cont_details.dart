import 'package:ecommerce_app_food/core/utils/costume_text.dart';
import 'package:ecommerce_app_food/core/share/section_icons.dart';
import 'package:ecommerce_app_food/core/utils/colors.dart';
import 'package:ecommerce_app_food/features/DetailsScreens/logic/cubit/product_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ContDetails extends StatelessWidget {
  final dynamic product;
  const ContDetails({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 360.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30.r)),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CostumeText(text: product.name.toString()),
              Gap(7.h),
              _buildRatingSection(product.stars ?? 1),
              Gap(15.h),
              SectionIcons(sizeIcons: 25.sp, isGap: true),
              Gap(15.h),
              CostumeText(text: "Introduce"),
              Gap(5.h),
              Expanded(
                child: SingleChildScrollView(
                  child: BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
                    builder: (context, state) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.description.toString(),
                            maxLines: state.isExpanded ? null : 3,
                            overflow: state.isExpanded
                                ? TextOverflow.visible
                                : TextOverflow.ellipsis,
                            style: TextStyle(
                              color: AppColors.titleColor,
                              fontSize: 14.sp,
                            ),
                          ),
                          Gap(4.h),
                          GestureDetector(
                            onTap: () => context
                                .read<ProductDetailsCubit>()
                                .toggleExpand(),
                            child: Row(
                              children: [
                                Text(
                                  state.isExpanded ? "See Less " : "See more",
                                  style: TextStyle(
                                    color: AppColors.mainColor,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Icon(
                                  state.isExpanded
                                      ? Icons.arrow_drop_up
                                      : Icons.arrow_drop_down,
                                  size: 22.sp,
                                  color: AppColors.mainColor,
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRatingSection(int stars) {
    return Row(
      children: [
        Wrap(
          children: List.generate(
            stars,
            (index) =>
                Icon(Icons.star, color: AppColors.mainColor, size: 18.sp),
          ),
        ),
        Gap(10.h),
        CostumeText(text: "4.5", fontSize: 14.sp, color: AppColors.textColor),
        Gap(10.h),
        CostumeText(
          text: "1287 comments",
          fontSize: 14.sp,
          color: AppColors.textColor,
        ),
      ],
    );
  }
}
