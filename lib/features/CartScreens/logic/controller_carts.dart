// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecommerce_app_food/core/models/model_foodApp.dart';
import 'package:ecommerce_app_food/features/CartScreens/data/models/cart_models.dart';
import 'package:get/get.dart';

import 'package:ecommerce_app_food/features/CartScreens/data/repo/cart_repo.dart';

class ControllerCarts extends GetxController {
  CartRepo cartRepo;
  ControllerCarts({required this.cartRepo});
  Map<int, CartModels> items = {};
  void addItems(ProductModel product, int quantity) {
    // لاحظ هنا: بنجمع الكمية الجديدة على القديمة
    items.update(
      product.id!,
      (value) {
        return CartModels(
          id: value.id,
          name: value.name,
          price: value.price,
          img: value.img,
          quantity: value.quantity! + quantity, // تحديث: جمع وليس استبدال
          isExcited: true,
          time: DateTime.now().toString(),
        );
      },
      ifAbsent: () {
        return CartModels(
          id: product.id,
          name: product.name,
          price: product.price,
          img: product.img,
          quantity: quantity,
          isExcited: true,
          time: DateTime.now().toString(),
        );
      },
    );

    // لو الكمية وصلت لصفر أو أقل، احذف المنتج من السلة
    if (items[product.id!]!.quantity! <= 0) {
      items.remove(product.id);
    }

    update();
  }

  void removeCard(int productId) {
    items.remove(productId);
    update();
  }

  void printCartData() {
    print("--- محتويات السلة الحالية ---");
    items.forEach((key, value) {
      print(
        "المنتج: ${value.name} | الكمية: ${value.quantity} | السعر الإجمالي: ${value.price! * value.quantity!}",
      );
    });
    print("إجمالي عدد العناصر المختلفة: ${items.length}");
    print("إجمالي عدد القطع (Total Quantity): $totalItems");
    print("----------------------------");
  }

  int get totalItems {
    var totalQuantity = 0;
    items.forEach((key, value) {
      totalQuantity += value.quantity!;
    });
    return totalQuantity;
  }

  int getQuantity(ProductModel product) {
    var quantity = 0;
    if (items.containsKey(product.id)) {
      items.forEach((key, value) {
        if (key == product.id) {
          quantity = value.quantity!;
        }
      });
    }
    return quantity;
  }
}
