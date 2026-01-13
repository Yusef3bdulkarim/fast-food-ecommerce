import 'package:bloc/bloc.dart';
import 'package:ecommerce_app_food/features/HomeScreens/data/models/model_foodApp.dart';
import 'package:ecommerce_app_food/features/CartScreens/data/models/cart_models.dart';
import 'package:ecommerce_app_food/features/CartScreens/data/repo/cart_repo.dart';
import 'package:equatable/equatable.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final CartRepo cartRepo;
  CartCubit({required this.cartRepo}) : super(const CartState());

  void addItems(ProductModel product, int quantity) {
    // نأخذ نسخة من الـ Map الحالية (لأن الأصلية immutable)
    final Map<int, CartModels> updatedItems = Map.from(state.items);

    if (updatedItems.containsKey(product.id)) {
      updatedItems.update(product.id!, (value) {
        return value.copyWith(
          quantity: value.quantity! + quantity,
          time: DateTime.now().toString(),
        );
      });
    } else {
      if (quantity > 0) {
        updatedItems.putIfAbsent(product.id!, () {
          return CartModels(
            id: product.id,
            name: product.name,
            price: product.price!,
            img: product.img,
            quantity: quantity,
            isExcited: true,
            time: DateTime.now().toString(),
          );
        });
      }
    }

    // حذف المنتج إذا أصبحت الكمية 0 أو أقل
    if (updatedItems.containsKey(product.id) &&
        updatedItems[product.id]!.quantity! <= 0) {
      updatedItems.remove(product.id);
    }

    emit(state.copyWith(items: updatedItems, lastUpdated: DateTime.now()));
  }

  void removeItem(int productId) {
    final Map<int, CartModels> updatedItems = Map.from(state.items);
    updatedItems.remove(productId);
    emit(state.copyWith(items: updatedItems, lastUpdated: DateTime.now()));
  }

  // Getters للحصول على المعلومات بسهولة في الـ UI
  int get totalItems {
    return state.items.values.fold(
      0,
      (sum, item) => sum + (item.quantity ?? 0),
    );
  }

  double get totalAmount {
    return state.items.values.fold(
      0.0,
      (sum, item) => sum + (item.price! * item.quantity!),
    );
  }
}
