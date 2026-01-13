import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit() : super(ProductDetailsState());

  void initProduct(double price) {
    emit(state.copyWith(totalPrice: price, quantity: 1));
  }

  // داخل PopularProductCubit
  int _quantity = 0;
  int get quantity => _quantity;
  void setQuantity(bool isIncrement) {
    int currentQty = state.quantity;
    if (isIncrement) {
      emit(state.copyWith(quantity: currentQty + 1));
    } else {
      if (currentQty > 0) {
        emit(state.copyWith(quantity: currentQty - 1));
      }
    }
  }

  void addQuantity(double unitPrice) {
    if (state.quantity < 20) {
      // حد أقصى مثلاً
      int newQty = state.quantity + 1;
      emit(state.copyWith(quantity: newQty, totalPrice: newQty * unitPrice));
    }
  }

  void removeQuantity(double unitPrice) {
    if (state.quantity > 1) {
      int newQty = state.quantity - 1;
      emit(state.copyWith(quantity: newQty, totalPrice: newQty * unitPrice));
    }
  }

  void toggleExpand() {
    emit(state.copyWith(isExpanded: !state.isExpanded));
  }
}
