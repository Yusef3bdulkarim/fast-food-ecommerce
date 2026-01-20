part of 'cart_cubit.dart';

class CartState extends Equatable {
  final Map<int, CartModels> items;
  final DateTime? lastUpdated;

  const CartState({this.items = const {}, this.lastUpdated});

  CartState copyWith({Map<int, CartModels>? items, DateTime? lastUpdated}) {
    return CartState(
      items: items ?? this.items,
      lastUpdated: lastUpdated ?? this.lastUpdated,
    );
  }

  @override
  List<Object?> get props => [items, lastUpdated];
}
