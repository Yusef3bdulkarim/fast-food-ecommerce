import 'package:ecommerce_app_food/core/utils/colors.dart';
import 'package:ecommerce_app_food/core/utils/costume_text.dart';
import 'package:ecommerce_app_food/features/location/logic/cubit/location_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'package:latlong2/latlong.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  final MapController _mapController = MapController();

  @override
  void initState() {
    super.initState();
    context.read<LocationCubit>().startLocationProcess();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<LocationCubit, LocationState>(
        builder: (context, state) {
          // 1. حالة التحميل الأولية
          if (state is LocationLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          // 2. حالة النجاح (لما يكون معانا موقع)
          if (state is LocationSuccess) {
            return Stack(
              children: [
                FlutterMap(
                  mapController: _mapController,
                  options: MapOptions(
                    initialCenter: LatLng(
                      state.currentPossition.latitude,
                      state.currentPossition.longitude,
                    ),
                    initialZoom: 15.0,

                    onMapEvent: (event) {
                      if (event is MapEventMoveStart) {
                        context.read<LocationCubit>().changeMovingState(true);
                      } else if (event is MapEventMoveEnd) {
                        context.read<LocationCubit>().changeMovingState(false);
                        final center = event.camera.center;

                        context.read<LocationCubit>().updateAddressFromMap(
                          center.latitude,
                          center.longitude,
                        );
                      }
                    },
                  ),
                  children: [
                    TileLayer(
                      urlTemplate:
                          'https://{s}.tile.openstreetmap.fr/hot/{z}/{x}/{y}.png',
                      subdomains: const ['a', 'b', 'c'],
                      userAgentPackageName:
                          'com.yousef.ecommerce_food_app_unique_123',
                    ),
                  ],
                ),

                // الدبوس اللي في النص
                Center(
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.easeInOut,
                    margin: EdgeInsets.only(
                      bottom: context.read<LocationCubit>().isMoving
                          ? 70.h
                          : 45.h,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // الدبوس نفسه
                        Icon(
                          Icons.location_on,
                          color: context.read<LocationCubit>().isMoving
                              ? Colors.orange
                              : Colors.red,
                          size: 45.sp,
                        ),

                        if (context.read<LocationCubit>().isMoving)
                          Container(
                            width: 10.w,
                            height: 5.h,
                            decoration: BoxDecoration(
                              color: Colors.black26,
                              borderRadius: BorderRadius.circular(50.r),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),

                Positioned(
                  // bottom: 20,
                  left: 20.h,
                  right: 20.h,
                  top: 50.w,
                  child: Container(
                    padding: EdgeInsets.all(15.h),
                    decoration: BoxDecoration(
                      color: AppColors.mainColor,
                      borderRadius: BorderRadius.circular(12.r),
                      boxShadow: const [
                        BoxShadow(color: Colors.black26, blurRadius: 10),
                      ],
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Colors.orange,
                            size: 22.sp,
                          ),
                          Gap(4.w),
                          CostumeText(
                            text: state.address,
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // زرار التأكيد
                Positioned(
                  bottom: 100.h,
                  left: 50.w,
                  right: 50.w,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                    ),
                    onPressed: () {
                      context.read<LocationCubit>().saveFinalLocation(
                        state.address,
                        state.currentPossition,
                      );
                      Navigator.pop(context);
                    },
                    child: CostumeText(
                      text: "Pick address !",
                      color: Colors.white,
                      fontSize: 16.sp,
                    ),
                  ),
                ),
              ],
            );
          }

          return Center(child: CostumeText(text: "Please Active Location !"));
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          final cubit = context.read<LocationCubit>();

          if (cubit.currentPosition != null) {
            _mapController.move(
              LatLng(
                cubit.currentPosition!.latitude,
                cubit.currentPosition!.longitude,
              ),
              15.0,
            );
          } else {
            cubit.getUSerLocation();
          }
        },
        child: const Icon(Icons.my_location, color: Colors.blue),
      ),
    );
  }
}
