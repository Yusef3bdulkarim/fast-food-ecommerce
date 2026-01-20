import 'package:ecommerce_app_food/core/routing/routing_helper.dart';
import 'package:ecommerce_app_food/core/utils/colors.dart';
import 'package:ecommerce_app_food/core/utils/costume_text.dart';
import 'package:ecommerce_app_food/features/CartScreens/logic/cubit/cart_cubit.dart';
import 'package:ecommerce_app_food/features/auth/UI/widgets/image_profile.dart';
import 'package:ecommerce_app_food/features/auth/UI/widgets/list_profile_details.dart';
import 'package:ecommerce_app_food/features/auth/logic/cubit/auth_cubit.dart';
import 'package:ecommerce_app_food/features/location/logic/cubit/location_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    // اطلب بيانات البروفايل أول ما الصفحة تفتح
    context.read<AuthCubit>().getUserProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocListener<LocationCubit, LocationState>(
        listener: (context, state) {
          if (state is LocationServiceDisabled) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.redAccent,
                content: Center(
                  child: CostumeText(
                    text: "Please active the site service (GPS)",
                  ),
                ),
              ),
            );
          } else if (state is LocationPermissionDenied) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.redAccent,
                content: Center(
                  child: CostumeText(
                    text: "Please active the site service (GPS)",
                  ),
                ),
              ),
            );
          }
        },
        child: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            if (state is ProfileLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is ProfileSuccess) {
              return CustomScrollView(
                slivers: [
                  SliverAppBar(
                    pinned: true,
                    toolbarHeight: 50.h,
                    backgroundColor: AppColors.mainColor,
                    automaticallyImplyLeading: false,
                    title: Center(
                      child: CostumeText(
                        text: "Profile",
                        color: Colors.white,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  ImageProfile(),
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        ListProfileDetails(
                          circleBackground: AppColors.mainColor,
                          title: "${state.model.fName}",
                          icon: Icons.person_2_outlined,
                        ),

                        ListProfileDetails(
                          circleBackground: AppColors.yellowColor,
                          title: '${state.model.phone}',
                          icon: Icons.call,
                        ),

                        ListProfileDetails(
                          circleBackground: AppColors.paraColor,
                          title: '${state.model.email}',
                          icon: Icons.email,
                        ),

                        BlocBuilder<LocationCubit, LocationState>(
                          builder: (context, state) {
                            String displayAddress = "Fill in Your Location";

                            if (state is LocationSuccess) {
                              displayAddress = state.address;
                            }
                            return GestureDetector(
                              onTap: () => Navigator.pushNamed(
                                context,
                                RoutingHelper.locationScreen,
                              ),
                              child: ListProfileDetails(
                                circleBackground: Colors.blueGrey,
                                title: displayAddress,

                                icon: Icons.location_on,
                              ),
                            );
                          },
                        ),

                        ListProfileDetails(
                          circleBackground: AppColors.OrangeColor,
                          title: 'none',
                          icon: Icons.message,
                        ),
                      ],
                    ),
                  ),

                  SliverToBoxAdapter(
                    child: GestureDetector(
                      onTap: () {
                        context.read<AuthCubit>().logOut();
                        context.read<CartCubit>().cleanCartList();
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          RoutingHelper.loginIn,
                          (route) => false,
                        );
                      },
                      child: ListProfileDetails(
                        circleBackground: AppColors.mainColor,
                        title: 'Log out',
                        icon: Icons.logout_outlined,
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(child: Gap(20.h)),
                ],
              );
            } else {
              return Center(child: Text("Error loading profile"));
            }
          },
        ),
      ),
    );
  }
}
