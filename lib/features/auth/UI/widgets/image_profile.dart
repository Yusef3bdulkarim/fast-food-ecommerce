import 'dart:io';

import 'package:ecommerce_app_food/core/utils/colors.dart';
import 'package:ecommerce_app_food/core/utils/costume_text.dart';
import 'package:ecommerce_app_food/features/auth/logic/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ImageProfile extends StatelessWidget {
  const ImageProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        // بنعرف متغير للمسار عشان نسهل استخدامه
        String? imagePath;

        // بنتحقق لو الحالة هي Success عشان نجيب المسار منها
        if (state is ProfileSuccess) {
          imagePath = state.localImagePath;
        }

        return SliverToBoxAdapter(
          child: GestureDetector(
            onTap: () => context.read<AuthCubit>().pickAndSaveImage(),
            child: Center(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20.h),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 5.w),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          spreadRadius: 2,
                        ),
                      ],
                    ),

                    child: CircleAvatar(
                      radius: 75.r,
                      backgroundColor: Colors.grey.shade200,
                      backgroundImage:
                          (imagePath != null && imagePath.isNotEmpty)
                          ? FileImage(File(imagePath))
                          : const AssetImage("assets/image/profile_icon.webp")
                                as ImageProvider,
                    ),
                  ),
                  Gap(5.h),
                  GestureDetector(
                    onTap: () => context.read<AuthCubit>().pickAndSaveImage(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.edit,
                          size: 16.sp,
                          color: AppColors.OrangeColor,
                        ),
                        Gap(5.w),
                        CostumeText(
                          text: "Edit Photo",
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.OrangeColor,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
