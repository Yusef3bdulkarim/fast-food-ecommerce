import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ecommerce_app_food/features/HomeScreens/data/repo/repo_popularProduct.dart';
import 'package:ecommerce_app_food/features/HomeScreens/data/repo/repo_recommended.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final RepoPopularproduct repoPopularproduct;
  final RepoRecommendedproduct repoRecommendedProduct;

  HomeCubit({
    required this.repoPopularproduct,
    required this.repoRecommendedProduct,
  }) : super(HomeInitialState());

  double currentIndex = 0.0;
  int pageIndex = 0;

  Future<void> getData() async {
    emit(HomeLoadingState());
    try {
      final result = await Future.wait([
        repoPopularproduct.getPopularFoodList(),
        repoRecommendedProduct.getRecommendedFoodList(),
      ]);

      emit(
        HomeSuccessState(
          popularProducts: result[0],
          recommendedProducts: result[1],
          currentIndex: 0.0,
          pageIndex: pageIndex,
        ),
      );
    } catch (e) {
      emit(HomeErrorState(message: "الايرور يباشا اهه: ${e.toString()}"));
    }
  }

  void updatePageIndictor(double index) {
    if (state is HomeSuccessState) {
      emit((state as HomeSuccessState).copyWith(currentIndex: index));
    }
  }

  void changePageIndex(int index) {
    pageIndex = index;
    if (state is HomeSuccessState) {
      emit((state as HomeSuccessState).copyWith(pageIndex: index));
    } else {
      emit(HomeInitialState());
    }
  }
}
