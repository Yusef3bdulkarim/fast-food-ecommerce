import 'package:ecommerce_app_food/core/routing/routing_helper.dart';
import 'package:ecommerce_app_food/core/utils/colors.dart';
import 'package:ecommerce_app_food/core/utils/costume_text.dart';
import 'package:ecommerce_app_food/features/auth/UI/widgets/custom_auth_feild.dart';
import 'package:ecommerce_app_food/features/auth/logic/cubit/auth_cubit.dart';
import 'package:ecommerce_app_food/features/auth/models/data/model_body_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  List<String> nameImage = [
    "assets/image/f.png",
    "assets/image/g.png",
    "assets/image/t.png",
  ];
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();
  @override
  void dispose() {
    // تنظيف الـ Controllers من الذاكرة
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Success Registration"),
                backgroundColor: AppColors.mainColor,
              ),
            );
            Navigator.pushNamedAndRemoveUntil(
              context,
              RoutingHelper.loginIn,
              (route) => false,
            );
          } else if (state is AuthEror) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(top: 60.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Image.asset(
                      "assets/image/logo part 1.png",
                      width: 220.w,
                      fit: BoxFit.cover,
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
                          Gap(20.h),
                          CustomAuthField(
                            colorIcon: AppColors.OrangeColor,
                            hintText: "Full Name",
                            icon: Icons.person_outline,
                            controller: _nameController,
                            validator: (v) =>
                                v!.isEmpty ? "name isn't empty" : null,
                          ),
                          Gap(15.h),

                          CustomAuthField(
                            colorIcon: AppColors.mainColor,
                            hintText: "Email",
                            icon: Icons.email_outlined,
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            validator: (v) =>
                                !v!.contains("@") ? "email is wrong" : null,
                          ),
                          Gap(15.h),

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
                            icon: Icons.lock_outline,
                            controller: _passwordController,
                            isPassword: true,
                            validator: (v) =>
                                v!.length < 6 ? "Password isn't correct" : null,
                          ),
                          Gap(30),
                          SizedBox(
                            width: 170.w,
                            height: 50.h,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.orangeAccent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(35.r),
                                ),
                                elevation: 0,
                              ),
                              onPressed: state is AuthLoading
                                  ? null
                                  : () {
                                      if (_formKey.currentState!.validate()) {
                                        context.read<AuthCubit>().userRegister(
                                          ModelBodyAuth(
                                            name: _nameController.text,
                                            email: _emailController.text,
                                            password: _passwordController.text,
                                            phone: _phoneController.text,
                                          ),
                                        );
                                      }
                                    },
                              child: state is AuthLoading
                                  ? const CircularProgressIndicator(
                                      color: Colors.white,
                                    )
                                  : CostumeText(
                                      text: "Sign up",
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                            ),
                          ),
                          Gap(10.h),
                          GestureDetector(
                            onTap: () => Navigator.pushNamed(
                              context,
                              RoutingHelper.loginIn,
                            ),
                            child: CostumeText(
                              text: "Have an account already ? ",
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color.fromARGB(255, 149, 156, 159),
                            ),
                          ),
                          Gap(20.h),
                          CostumeText(
                            text: "Sing up using one of the following methods ",
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w200,
                            color: const Color.fromARGB(255, 149, 156, 159),
                          ),
                          Gap(7.h),
                          Wrap(
                            children: List.generate(3, (index) {
                              return Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20.w),
                                child: CircleAvatar(
                                  radius: 30.r,
                                  backgroundImage: AssetImage(nameImage[index]),
                                ),
                              );
                            }),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}






// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:ecommerce_app_food/features/auth/presentation/cubit/signup_cubit.dart';
// import 'package:ecommerce_app_food/features/auth/models/data/model_body_auth.dart';

// class SignupScreen extends StatefulWidget {
//   const SignupScreen({super.key});

//   @override
//   State<SignupScreen> createState() => _SignupScreenState();
// }

// class _SignupScreenState extends State<SignupScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final _nameController = TextEditingController();
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();
//   final _phoneController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: BlocConsumer<SignupCubit, AuthState>(
//         listener: (context, state) {
//           if (state is AuthSuccess) {
//             ScaffoldMessenger.of(context).showSnackBar(
//               const SnackBar(content: Text("أهلاً بك في عائلتنا!"), backgroundColor: Colors.green),
//             );
//           } else if (state is AuthEror) {
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(content: Text(state.message), backgroundColor: Colors.red),
//             );
//           }
//         },
//         builder: (context, state) {
//           return SafeArea(
//             child: SingleChildScrollView(
//               padding: const EdgeInsets.all(24.0),
//               child: Form(
//                 key: _formKey,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const SizedBox(height: 40),
//                     const Text(
//                       "إنشاء حساب جديد",
//                       style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
//                     ),
//                     const Text(
//                       "سجل الآن وابدأ بطلب طعامك المفضل",
//                       style: TextStyle(color: Colors.grey),
//                     ),
//                     const SizedBox(height: 40),
                    
//                     CustomAuthField(
//                       hintText: "الاسم الكامل",
//                       icon: Icons.person_outline,
//                       controller: _nameController,
//                       validator: (v) => v!.isEmpty ? "الاسم مطلوب" : null,
//                     ),
//                     const SizedBox(height: 20),
                    
//                     CustomAuthField(
//                       hintText: "البريد الإلكتروني",
//                       icon: Icons.email_outlined,
//                       controller: _emailController,
//                       keyboardType: TextInputType.emailAddress,
//                       validator: (v) => !v!.contains("@") ? "بريد غير صالح" : null,
//                     ),
//                     const SizedBox(height: 20),

//                     CustomAuthField(
//                       hintText: "رقم الهاتف",
//                       icon: Icons.phone_android_outlined,
//                       controller: _phoneController,
//                       keyboardType: TextInputType.phone,
//                       validator: (v) => v!.length < 11 ? "رقم غير صحيح" : null,
//                     ),
//                     const SizedBox(height: 20),

//                     CustomAuthField(
//                       hintText: "كلمة السر",
//                       icon: Icons.lock_outline,
//                       controller: _passwordController,
//                       isPassword: true,
//                       validator: (v) => v!.length < 6 ? "كلمة السر ضعيفة" : null,
//                     ),
//                     const SizedBox(height: 40),

//                     SizedBox(
//                       width: double.infinity,
//                       height: 55,
//                       child: ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.orangeAccent,
//                           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//                           elevation: 0,
//                         ),
//                         onPressed: state is AuthLoading ? null : () {
//                           if (_formKey.currentState!.validate()) {
//                              context.read<SignupCubit>().userRegister(
//                                ModelBodyAuth(
//                                  name: _nameController.text,
//                                  email: _emailController.text,
//                                  password: _passwordController.text,
//                                  phone: int.parse(_phoneController.text),
//                                )
//                              );
//                           }
//                         },
//                         child: state is AuthLoading 
//                           ? const CircularProgressIndicator(color: Colors.white)
//                           : const Text("إنشاء الحساب", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }