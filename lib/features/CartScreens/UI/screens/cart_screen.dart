import 'package:ecommerce_app_food/core/share/header_icon.dart';
import 'package:ecommerce_app_food/core/utils/colors.dart';
import 'package:ecommerce_app_food/core/utils/constans_app.dart';
import 'package:ecommerce_app_food/core/utils/costume_text.dart';
import 'package:ecommerce_app_food/features/CartScreens/logic/controller_carts.dart';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: 40,
            left: 20,
            right: 20,
            child: HeaderIcon(
              icon: Icons.arrow_back_ios_new_outlined,
              isHomeIcons: false,
              background: AppColors.mainColor,
              colorIcons: Colors.white,
            ),
          ),

          Positioned(
            top: 80,
            left: 10,
            right: 10,
            bottom: 0,
            child: GetBuilder<ControllerCarts>(
              builder: (controllerCard) {
                var product = controllerCard.items.values.toList();
                return ListView.separated(
                  itemBuilder: (context, index) {
                    return Dismissible(
                      key: UniqueKey(),
                      direction: DismissDirection.endToStart,
                      background: Container(
                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.only(right: 20),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 173, 4, 4),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          Icons.delete,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                      onDismissed: (direction) {
                        controllerCard.removeCard(product[index].id!);
                      },
                      child: Container(
                        height: 115,
                        // width: 200,
                        decoration: BoxDecoration(
                          // color: const Color.fromARGB(255, 49, 15, 15),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            Container(
                              height: 110,
                              width: 110,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(19),
                                color: Colors.amber,
                                image: DecorationImage(
                                  image: NetworkImage(
                                    "${ConstantsApp.baseUrl + ConstantsApp.uploades + product[index].img!}",
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),

                            Container(
                              height: 100,
                              width: 260,
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
                                      text: product[index].name!,
                                      fontSize: 20,
                                    ),
                                    CostumeText(
                                      text: "spicy",
                                      fontSize: 14,
                                      color: AppColors.textColor,
                                    ),
                                    Gap(6),
                                    Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          CostumeText(
                                            text:
                                                "\$${(product[index].price! * product[index].quantity!).toString()}",
                                            fontSize: 14,
                                          ),
                                          Row(
                                            // crossAxisAlignment: CrossAxisAlignment.start/,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  controllerCard.addItems(
                                                    product[index]
                                                        .toProductModel(),
                                                    -1,
                                                  );
                                                },

                                                child: Icon(
                                                  Icons.remove,
                                                  size: 14,
                                                  color: const Color.fromARGB(
                                                    208,
                                                    0,
                                                    0,
                                                    0,
                                                  ),
                                                ),
                                              ),
                                              Gap(8),

                                              CostumeText(
                                                text:
                                                    "${product[index].quantity}",
                                                color: Colors.black,
                                                fontSize: 15,
                                              ),
                                              Gap(8),
                                              GestureDetector(
                                                onTap: () =>
                                                    controllerCard.addItems(
                                                      product[index]
                                                          .toProductModel(),
                                                      1,
                                                    ),
                                                child: Icon(
                                                  Icons.add,
                                                  size: 14,
                                                  color: const Color.fromARGB(
                                                    202,
                                                    0,
                                                    0,
                                                    0,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
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
                  separatorBuilder: (context, index) => Gap(15),
                  itemCount: product.length,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
