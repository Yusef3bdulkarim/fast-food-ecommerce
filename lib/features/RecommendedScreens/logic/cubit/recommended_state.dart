part of 'recommended_cubit.dart';

class RecommendedState extends Equatable {
  final double quantity;
  final double totalPrice;
  final bool isToggle;
  final bool isExpand;

  RecommendedState({
    this.quantity = 1.0,
    this.totalPrice = 0.0,
    this.isToggle = false,
    this.isExpand = false,
  });

  RecommendedState copyWith({
    double? quantity,
    double? totalPrice,
    bool? isToggle,
    bool? isExpand,
  }) {
    return RecommendedState(
      quantity: quantity ?? this.quantity,
      totalPrice: totalPrice ?? this.totalPrice,
      isToggle: isToggle ?? this.isToggle,
      isExpand: isExpand ?? this.isExpand,
    );
  }

  @override
  List<Object> get props => [quantity, totalPrice, isToggle, isExpand];
}
