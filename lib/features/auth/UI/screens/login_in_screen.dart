import 'package:ecommerce_app_food/core/routing/routing_helper.dart';
import 'package:ecommerce_app_food/core/utils/colors.dart';
import 'package:ecommerce_app_food/core/utils/costume_text.dart';
import 'package:ecommerce_app_food/features/auth/UI/widgets/custom_auth_feild.dart';
import 'package:ecommerce_app_food/features/auth/logic/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class LoginInScreen extends StatefulWidget {
  const LoginInScreen({super.key});

  @override
  State<LoginInScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<LoginInScreen> {
  final _formKey = GlobalKey<FormState>();

  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    // تنظيف الـ Controllers من الذاكرة

    _phoneController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 60.h),
          child: Column(
            children: [
              Center(
                child: Image.asset(
                  "assets/image/logo part 1.png",
                  width: 220.w,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CostumeText(
                      text: "Hello",
                      fontSize: 50.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.mainBlackColor,
                    ),

                    CostumeText(
                      text: "sign into your account ",
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textColor,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.h),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Gap(20),

                      CustomAuthField(
                        colorIcon: AppColors.yellowColor,
                        hintText: "Phone",
                        icon: Icons.phone_android_outlined,
                        controller: _phoneController,
                        keyboardType: TextInputType.phone,
                        validator: (v) =>
                            v!.length < 11 ? "phone isn't correct" : null,
                      ),
                      Gap(15.h),

                      CustomAuthField(
                        colorIcon: AppColors.iconColor1,
                        hintText: "Password",
                        icon: Icons.password_outlined,
                        controller: _passwordController,
                        isPassword: true,
                        validator: (v) =>
                            v!.length < 6 ? "Password isn't correct" : null,
                      ),
                      Gap(30.h),
                      BlocConsumer<AuthCubit, AuthState>(
                        listener: (context, state) {
                          if (state is LoginSuccess) {
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              RoutingHelper.initial,
                              (route) => false,
                            );
                          } else if (state is LoginEror) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(state.message),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }
                        },
                        builder: (context, state) {
                          return SizedBox(
                            width: 170.w,
                            height: 50.h,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.mainColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(35.r),
                                ),
                                elevation: 0,
                              ),
                              onPressed: state is LoginLoading
                                  ? null
                                  : () {
                                      if (_formKey.currentState!.validate()) {
                                        context.read<AuthCubit>().userLogin(
                                          phone: _phoneController.text,
                                          password: _passwordController.text,
                                        );
                                      }
                                    },
                              child: state is LoginLoading
                                  ? CircularProgressIndicator(
                                      color: AppColors.mainColor,
                                    )
                                  : CostumeText(
                                      text: "Sign In",
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                            ),
                          );
                        },
                      ),
                      Gap(20.h),
                      GestureDetector(
                        onTap: () =>
                            Navigator.pushNamed(context, RoutingHelper.signUp),
                        child: RichText(
                          text: TextSpan(
                            text: "Don't an account ?",
                            style: TextStyle(
                              color: AppColors.textColor,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                            children: [
                              TextSpan(
                                text: " Create ",
                                style: TextStyle(
                                  color: AppColors.mainBlackColor,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
