// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ecommerce_app_food/features/HomeScreens/data/repo/repo_popularProduct.dart';
import 'package:ecommerce_app_food/features/HomeScreens/data/repo/repo_recommended.dart';
import 'package:flutter/material.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final RepoPopularproduct repoPopularproduct;
  final RepoRecommendedproduct repoRecommendedProduct;

  HomeCubit({
    required this.repoPopularproduct,
    required this.repoRecommendedProduct,
  }) : super(HomeInitialState());

  // خلي المتغير ده خاص بالـ Logic لو محتاجه،
  // بس الأفضل نعتمد على اللي جوه الـ State
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
          currentIndex: 0.0, // بيبدأ من الصفر دائماً عند أول تحميل
        ),
      );
    } catch (e) {
      emit(HomeErrorState(message: "الايرور يباشا اهه: ${e.toString()}"));
    }
  }

  void updatePageIndictor(double index) {
    if (state is HomeSuccessState) {
      // بنستخدم copyWith عشان نحدث الـ index بس من غير ما نهز بيانات المنتجات
      emit((state as HomeSuccessState).copyWith(currentIndex: index));
    }
  }

  void changePageIndex(int index) {
    pageIndex = index;
    // ممكن تضيف emit لو عايز تحدث الواجهة بناءً على تغيير الصفحة
    if (state is HomeSuccessState) {
      // بنعمل emit لنفس الحالة بس بالـ pageIndex الجديد
      emit((state as HomeSuccessState).copyWith(pageIndex: index));
    } else {
      // لو إنت لسه في حالة الـ Loading أو الـ Initial
      // لازم برضه تعمل emit عشان الـ BottomNavBar يغير شكل الأيقونة المنورة
      emit(HomeInitialState());
    }
  }
}
