import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'recommended_state.dart';

class RecommendedCubit extends Cubit<RecommendedState> {
  RecommendedCubit() : super(RecommendedState());
  void initProduct(double price) {
    emit(state.copyWith(totalPrice: price, quantity: 1));
  }

  int _quantity = 0;
  int get quantity => _quantity;
  void setQuantity(bool isIncrement) {
    int currentQty = state.quantity.toInt();
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
      double newQty = state.quantity + 1;
      emit(state.copyWith(quantity: newQty, totalPrice: newQty * unitPrice));
    }
  }

  void removeQuantity(double unitPrice) {
    if (state.quantity > 1) {
      double newQty = state.quantity - 1;
      emit(state.copyWith(quantity: newQty, totalPrice: newQty * unitPrice));
    }
  }

  void toggleExpand() {
    emit(state.copyWith(isToggle: !state.isToggle));
  }

  void isToggleExpand() {
    emit(state.copyWith(isExpand: !state.isExpand));
  }
}
