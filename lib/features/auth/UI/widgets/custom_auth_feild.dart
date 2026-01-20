// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:ecommerce_app_food/core/utils/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAuthField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool isPassword;
  final Color colorIcon;
  final TextInputType keyboardType;

  const CustomAuthField({
    Key? key,
    required this.hintText,
    required this.icon,
    required this.controller,
    this.validator,
    this.isPassword = false,
    required this.colorIcon,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      keyboardType: keyboardType,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Icon(icon, color: colorIcon),
        filled: true,
        fillColor: Colors.grey[100],
        // البوردر في الحالة العادية
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide(color: Colors.grey[300]!),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide(color: AppColors.OrangeColor, width: 2.w),
        ),
        // البوردر في حالة الخطأ
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide(color: AppColors.OrangeColor),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide(color: AppColors.OrangeColor, width: 2.w),
        ),
      ),
    );
  }
}
