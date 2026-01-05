import 'package:ecommerce_app_food/core/routing/routing_helper.dart';
import 'package:ecommerce_app_food/core/utils/constans_app.dart';
import 'package:ecommerce_app_food/core/utils/costume_text.dart';
import 'package:ecommerce_app_food/core/share/section_icons.dart';
import 'package:ecommerce_app_food/core/utils/colors.dart';
import 'package:ecommerce_app_food/features/HomeScreens/logic/controller_popularProduct.dart';
import 'package:ecommerce_app_food/features/HomeScreens/logic/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SlideBackground extends StatelessWidget {
  SlideBackground({super.key});
  final HomeController controller = Get.put(HomeController());
  final double minScale = 0.85.h; // أصغر حجم للكارد بعيد عن الفوكس
  final double maxTranslate = 30.0.h; // أعلى مسافة للكارد بعيد عن الفوكس
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350.h,
      child: GetBuilder<ControllerFood>(
        builder: (_controller) {
          return PageView.builder(
            controller: controller.pageController,
            itemCount: _controller.newList.length,
            itemBuilder: (context, index) {
              return Obx(() {
                final distance = (controller.currentIndex.value - index).abs();

                final scale = (1 - distance * (1 - minScale / 1.h)).clamp(
                  minScale / 1.h,
                  1.0,
                );

                final translateY = distance * maxTranslate;

                final opacity = (1 - distance * 0.5).clamp(0.5, 1.0);

                return GestureDetector(
                  onTap: () {
                    Get.toNamed(RoutingHelper.getPopularProductScreen(index));
                  },
                  child: Center(
                    child: AnimatedOpacity(
                      duration: Duration(milliseconds: 200),
                      opacity: opacity,
                      child: Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.identity()
                          ..translate(0.0, translateY)
                          ..scale(1.0, scale, 1.0),
                        child: Stack(
                          children: [
                            Container(
                              height: 300.h,
                              width: 350.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            Positioned(
                              child: Container(
                                height: 200.h,
                                width: double.infinity,
                                margin: EdgeInsets.symmetric(horizontal: 10.w),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25.r),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      ConstantsApp.baseUrl +
                                          "uploads/" +
                                          _controller.newList[index].img!,
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),

                            Positioned(
                              bottom: 20.h,
                              left: 30.w,
                              right: 25.w,
                              child: Container(
                                height: 120.h,
                                // width: 300.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25.r),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0xFFe8e8e8),
                                      blurRadius: 5.r,
                                      offset: Offset(0, 5.h),
                                    ),
                                    BoxShadow(
                                      color: Colors.white,
                                      offset: Offset(-5.h, 0),
                                    ),
                                    BoxShadow(
                                      color: Colors.white,
                                      offset: Offset(-5.h, 0),
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    top: 18.w,
                                    left: 15.h,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    // mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      CostumeText(
                                        text: _controller.newList[index].name!,
                                      ),
                                      Gap(5.h),
                                      Row(
                                        children: [
                                          Wrap(
                                            children: List.generate(
                                              _controller.newList[index].stars,
                                              (index) => Icon(
                                                Icons.star,
                                                color: AppColors.mainColor,
                                                size: 18.sp,
                                              ),
                                            ),
                                          ),
                                          Gap(10.h),
                                          CostumeText(
                                            text: "4.5",
                                            fontSize: 14.sp,
                                            color: AppColors.textColor,
                                          ),
                                          Gap(10.h),
                                          CostumeText(
                                            text: "1287 comments",
                                            fontSize: 14.sp,
                                            color: AppColors.textColor,
                                          ),
                                        ],
                                      ),
                                      Gap(15.h),
                                      SectionIcons(
                                        sizeIcons: 25.sp,
                                        isGap: true,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ), // الكارد بتاعك
                      ),
                    ),
                  ),
                );
              });
            },
          );
        },
      ),
    );
  }
}


// SizedBox(
    //   height: 330,
    //   width: 320,
    //   child: PageView.builder(
    //     controller: controller.pageController,
    //     clipBehavior: Clip.none,
    //     scrollDirection: Axis.horizontal,
    //     itemBuilder: (context, index) {
    //       return Stack(
    //         children: [
    //           // Container(
    //           //   height: 330,
    //           //   width: 350,
    //           //   decoration: BoxDecoration(
    //           //     borderRadius: BorderRadius.circular(12),
    //           //   ),
    //           // ),
    //           Positioned(
    //             child: Container(
    //               height: 240,
    //               width: 300,
    //               decoration: BoxDecoration(
    //                 borderRadius: BorderRadius.circular(25),
    //                 image: const DecorationImage(
    //                   image: AssetImage("assets/image/food0.png"),
    //                   fit: BoxFit.cover,
    //                 ),
    //               ),
    //             ),
    //           ),

    //           Positioned(
    //             bottom: 5,
    //             left: 30,
    //             child: Container(
    //               height: 130,
    //               width: 280,
    //               decoration: BoxDecoration(
    //                 borderRadius: BorderRadius.circular(25),
    //                 color: Colors.white,
    //                 boxShadow: [
    //                   BoxShadow(
    //                     color: AppColors.titleColor,
    //                     spreadRadius: -19,
    //                     blurRadius: 20,
    //                     offset: Offset(0, 12),
    //                   ),
    //                 ],
    //               ),
    //               child: Padding(
    //                 padding: const EdgeInsets.only(top: 18, left: 21),
    //                 child: Column(
    //                   crossAxisAlignment: CrossAxisAlignment.start,
    //                   // mainAxisAlignment: MainAxisAlignment.start,
    //                   children: [
    //                     CostumeText(text: "Chinese Side"),
    //                     Gap(5),
    //                     Row(
    //                       children: [
    //                         Wrap(
    //                           children: List.generate(
    //                             5,
    //                             (index) => Icon(
    //                               Icons.star,
    //                               color: AppColors.mainColor,
    //                               size: 18,
    //                             ),
    //                           ),
    //                         ),
    //                         Gap(10),
    //                         CostumeText(
    //                           text: "4.5",
    //                           fontSize: 14,
    //                           color: AppColors.textColor,
    //                         ),
    //                         Gap(10),
    //                         CostumeText(
    //                           text: "1287 comments",
    //                           fontSize: 14,
    //                           color: AppColors.textColor,
    //                         ),
    //                       ],
    //                     ),
    //                     Gap(15),
    //                     SectionIcons(),
    //                   ],
    //                 ),
    //               ),
    //             ),
    //           ),
    //         ],
    //       );
    //     },
    //     itemCount: 5,
    //   ),
    // );