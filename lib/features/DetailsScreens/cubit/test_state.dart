part of 'test_cubit.dart';

sealed class TestState extends Equatable {
  const TestState();

  @override
  List<Object> get props => [];
}

// 1. حالة التحميل
final class TestLoadingState extends TestState {}

// 2. حالة النجاح (وهي اللي شايلة كل الداتا)
final class TestSuccessState extends TestState {
  final ProductModel product; // المنتج اللي بنعرض تفاصيله
  final int quantity; // الكمية (1, 2, 3...)

  const TestSuccessState({
    required this.product,
    this.quantity = 1, // بتبدأ بواحد افتراضياً
  });

  // الـ copyWith مهم جداً هنا علشان لما تغير الكمية متفقدش بيانات المنتج
  TestSuccessState copyWith({ProductModel? product, int? quantity}) {
    return TestSuccessState(
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
    );
  }

  @override
  List<Object> get props => [product, quantity];
}

// 3. حالة الخطأ
final class TestErrorState extends TestState {
  final String message;
  const TestErrorState(this.message);
}
