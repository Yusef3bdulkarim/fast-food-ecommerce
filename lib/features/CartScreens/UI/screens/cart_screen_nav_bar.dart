import 'package:ecommerce_app_food/core/utils/colors.dart';
import 'package:ecommerce_app_food/core/utils/constans_app.dart';
import 'package:ecommerce_app_food/core/utils/costume_text.dart';
import 'package:ecommerce_app_food/features/CartScreens/data/models/cart_models.dart';
import 'package:ecommerce_app_food/features/CartScreens/logic/cubit/cart_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class CartScreenNavBar extends StatelessWidget {
  CartScreenNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            pinned: true,
            floating: true,
            backgroundColor: AppColors.mainColor,
            elevation: 0,
            title: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CostumeText(
                    text: "Your Cart History",
                    color: Colors.white,
                    fontSize: 20,
                  ),
                  Icon(CupertinoIcons.cart, color: Colors.white, size: 30),
                ],
              ),
            ),
          ),
          BlocBuilder<CartCubit, CartState>(
            builder: (context, state) {
              final allItems = state.items.values.toList();

              // 2. تجميع العناصر التي تمت في نفس "الدقيقة" (أو خلال دقيقتين)
              Map<String, List<CartModels>> groupedItems = {};

              for (var item in allItems) {
                final time = DateTime.parse(item.time!);
                // التجميع هنا باليوم والساعة والدقيقة (عشان كل دقيقة تبقى مجموعة)
                String timeKey = DateFormat('yyyy-MM-dd HH:mm').format(time);

                if (!groupedItems.containsKey(timeKey)) {
                  groupedItems[timeKey] = [];
                }
                groupedItems[timeKey]!.add(item);
              }

              final groupKeys = groupedItems.keys.toList();

              return SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  final timeKey = groupKeys[index];
                  final productsInGroup = groupedItems[timeKey]!;

                  // حساب إجمالي المنتجات في هذه المجموعة
                  int totalItemsInGroup = productsInGroup.fold(
                    0,
                    (sum, item) => sum + item.quantity!,
                  );

                  return Container(
                    margin: EdgeInsets.symmetric(
                      vertical: 10.h,
                      horizontal: 10.w,
                    ),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CostumeText(
                          text: timeKey,
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                        SizedBox(height: 10.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // عرض الصور (بحد أقصى 3 صور)
                            Row(
                              children: productsInGroup.take(3).map((product) {
                                return Container(
                                  margin: EdgeInsets.only(right: 5.w),
                                  height: 70.h,
                                  width: 70.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.r),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        "${ConstantsApp.baseUrl}${ConstantsApp.uploades}${product.img!.split(',')[0]}",
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),

                            // عرض إجمالي عدد المنتجات في المجموعة
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                CostumeText(text: "Total", fontSize: 14),
                                CostumeText(
                                  text: "$totalItemsInGroup Items",
                                  fontSize: 18,
                                  color: AppColors.mainColor,
                                ),
                                // زرار التفاصيل
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 2,
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: AppColors.mainColor,
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: CostumeText(
                                    text: "View All",
                                    fontSize: 10,
                                    color: AppColors.mainColor,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }, childCount: groupKeys.length),
              );
            },
          ),
        ],
      ),
    );
  }
}
