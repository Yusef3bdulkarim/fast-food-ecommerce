import 'package:ecommerce_app_food/core/share/box_is_empty.dart';
import 'package:ecommerce_app_food/core/utils/colors.dart';
import 'package:ecommerce_app_food/core/utils/constans_app.dart';
import 'package:ecommerce_app_food/core/utils/costume_text.dart';
import 'package:ecommerce_app_food/features/CartScreens/logic/cubit/cart_cubit.dart';
import 'package:ecommerce_app_food/features/DetailsScreens/UI/screens/details_screen.dart';
import 'package:ecommerce_app_food/features/RecommendedScreens/UI/screens/ingredient_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ListProductCart extends StatelessWidget {
  const ListProductCart({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        var productList = state.items.values.toList();

        if (productList.isEmpty) {
          return SliverFillRemaining(
            child: BoxIsEmpty(text: "Your Cart is-Empty ! "),
          );
        }

        return SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            final item = productList[index];
            return Dismissible(
              key: ValueKey(item.id),
              direction: DismissDirection.endToStart,
              background: Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(right: 20),
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(Icons.delete, color: Colors.white, size: 30.sp),
              ),
              onDismissed: (direction) {
                context.read<CartCubit>().removeItem(item.id!);
              },
              child: GestureDetector(
                onTap: () {
                  final product = item.toProductModel();
                  if (item.typeId == 2) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            IngredientScreen(product: product),
                      ),
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsScreen(product: product),
                      ),
                    );
                  }
                },
                child: Container(
                  height: 100.h,
                  padding: EdgeInsets.symmetric(
                    vertical: 10.h,
                    horizontal: 15.w,
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 105.h,
                        width: 100.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(19),
                          image: DecorationImage(
                            image: NetworkImage(
                              "${ConstantsApp.baseUrl}${ConstantsApp.uploades}${item.img!}",
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),

                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10.w,
                            vertical: 5.h,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CostumeText(text: item.name!, fontSize: 16.sp),
                              CostumeText(
                                text: "spicy",
                                color: AppColors.textColor,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CostumeText(
                                    text:
                                        "\$${(item.price! * item.quantity!).toStringAsFixed(2)}",
                                    color: Colors.redAccent,
                                  ),
                                  Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          context.read<CartCubit>().addItems(
                                            item.toProductModel(),
                                            -1,
                                          );
                                        },
                                        child: Icon(
                                          Icons.remove,
                                          size: 20.sp,
                                          color: AppColors.mainColor,
                                        ),
                                      ),
                                      Gap(10.w),
                                      CostumeText(
                                        text: "${item.quantity}",
                                        fontSize: 16.sp,
                                      ),
                                      Gap(10.w),
                                      GestureDetector(
                                        onTap: () {
                                          context.read<CartCubit>().addItems(
                                            item.toProductModel(),
                                            1,
                                          );
                                        },
                                        child: Icon(
                                          Icons.add,
                                          size: 20.sp,
                                          color: AppColors.mainColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
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
          }, childCount: productList.length),
        );
      },
    );
  }
}
