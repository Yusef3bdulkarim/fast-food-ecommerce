part of 'product_details_cubit.dart';

class ProductDetailsState extends Equatable {
  final int quantity;
  final double totalPrice;
  final bool isExpanded;

  const ProductDetailsState({
    this.quantity = 1,
    this.totalPrice = 0.0,
    this.isExpanded = false,
  });

  ProductDetailsState copyWith({
    int? quantity,
    double? totalPrice,
    bool? isExpanded,
  }) {
    return ProductDetailsState(
      quantity: quantity ?? this.quantity,
      totalPrice: totalPrice ?? this.totalPrice,
      isExpanded: isExpanded ?? this.isExpanded,
    );
  }

  @override
  List<Object> get props => [quantity, totalPrice, isExpanded];
}
