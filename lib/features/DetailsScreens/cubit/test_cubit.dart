import 'package:bloc/bloc.dart';
import 'package:ecommerce_app_food/features/HomeScreens/data/models/model_foodApp.dart';
import 'package:equatable/equatable.dart';

part 'test_state.dart';

class TestCubit extends Cubit<TestState> {
  // 1. بنبدأ الـ Cubit بحالة الـ Loading أو Initial
  TestCubit() : super(TestLoadingState());

  // 2. وظيفة تجلب المنتج (مثلاً بنمرر لها المنتج اللي دوسنا عليه في الهوم)
  void initProduct(ProductModel product) {
    // بنخلي الحالة Success فوراً ومعاها المنتج والكمية المبدئية (1)
    emit(TestSuccessState(product: product, quantity: 1));
  }

  // 3. وظيفة الزيادة
  void increment() {
    // لازم نتأكد إننا في حالة الـ Success عشان نعدل الكمية
    if (state is TestSuccessState) {
      var currentState = state as TestSuccessState;
      int newQuantity = currentState.quantity + 1;
      emit(currentState.copyWith(quantity: newQuantity));
    }
  }

  void remove() {
    var currentState = state as TestSuccessState;

    emit(currentState.copyWith(quantity: 0));
  }

  // 4. وظيفة النقصان
  void decrement() {
    if (state is TestSuccessState) {
      var currentState = state as TestSuccessState;
      if (currentState.quantity > 1) {
        // شرط عشان ميفضلش ينقص لتحت الـ 1
        int newQuantity = currentState.quantity - 1;
        emit(currentState.copyWith(quantity: newQuantity));
      }
    }
  }
}
