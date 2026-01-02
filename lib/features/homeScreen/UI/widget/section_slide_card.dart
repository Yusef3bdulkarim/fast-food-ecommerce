import 'package:ecommerce_app_food/core/routing/routing_helper.dart';
import 'package:ecommerce_app_food/core/utils/constans_app.dart';
import 'package:ecommerce_app_food/core/utils/costume_text.dart';
import 'package:ecommerce_app_food/core/share/section_icons.dart';
import 'package:ecommerce_app_food/core/utils/colors.dart';
import 'package:ecommerce_app_food/features/homeScreen/logic/controller_recommend.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class SectionSlideCard extends StatelessWidget {
  const SectionSlideCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GetBuilder<ControllerRecommended>(
        builder: (_recommendeController) {
          if (_recommendeController.newList.isEmpty) {
            return Center(
              child: CircularProgressIndicator(color: AppColors.mainColor),
            );
          }
          return ListView.separated(
            scrollDirection: Axis.vertical,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => Get.toNamed(
                        RoutingHelper.getRecommendedProductScreen(index),
                      ),
                      child: Container(
                        height: 130,
                        width: 130,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: DecorationImage(
                            image: NetworkImage(
                              "${ConstantsApp.baseUrl + ConstantsApp.uploades + _recommendeController.newList[index].img ?? ""}",
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),

                    Container(
                      height: 100,
                      width: 210,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFFe8e8e8),
                            blurRadius: 5,
                            offset: Offset(2, 2),
                          ),
                          BoxShadow(
                            color: Colors.white,
                            blurRadius: 5,
                            offset: Offset(0, -5),
                          ),
                          BoxShadow(
                            color: Color(0xFFe8e8e8),
                            blurRadius: 5,
                            offset: Offset(-2, 0),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 7,
                          vertical: 12,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CostumeText(
                              text:
                                  _recommendeController.newList[index].name ??
                                  "",
                              fontSize: 20,
                            ),
                            CostumeText(
                              text: "with chineso charactreistics ",
                              fontSize: 14,
                              color: AppColors.textColor,
                            ),
                            Gap(6),
                            SectionIcons(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) => Gap(12),
            itemCount: _recommendeController.newList.length,
          );
        },
      ),
    );
  }
}
