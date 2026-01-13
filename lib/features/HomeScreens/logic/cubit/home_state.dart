// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeSuccessState extends HomeState {
  final List<dynamic> popularProducts;
  final List<dynamic> recommendedProducts;
  final double currentIndex;
  final int pageIndex;

  HomeSuccessState({
    required this.popularProducts,
    required this.recommendedProducts,
    this.currentIndex = 0.0,
    this.pageIndex = 0,
  });

  HomeSuccessState copyWith({
    List<dynamic>? popularProducts,
    List<dynamic>? recommendedProducts,
    double? currentIndex,
    int? pageIndex,
  }) {
    return HomeSuccessState(
      popularProducts: popularProducts ?? this.popularProducts,
      recommendedProducts: recommendedProducts ?? this.recommendedProducts,
      currentIndex: currentIndex ?? this.currentIndex,
      pageIndex: pageIndex ?? this.pageIndex,
    );
  }

  @override
  List<Object> get props => [
    popularProducts,
    recommendedProducts,
    currentIndex,
    pageIndex,
  ];
}

class HomeErrorState extends HomeState {
  final String message;

  HomeErrorState({required this.message});
}
