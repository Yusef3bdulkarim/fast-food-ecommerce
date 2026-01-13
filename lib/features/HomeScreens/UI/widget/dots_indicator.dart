import 'package:dots_indicator/dots_indicator.dart';
import 'package:ecommerce_app_food/core/utils/colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SectionDotsIndicator extends StatelessWidget {
  final int dotsCount;
  final double currentIndex;
  const SectionDotsIndicator({
    super.key,
    required this.dotsCount,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DotsIndicator(
        dotsCount: dotsCount == 0 ? 1 : dotsCount,
        position: currentIndex,
        decorator: DotsDecorator(
          activeColor: AppColors.mainColor,
          // ... نفس التنسيقات بتاعتك
        ),
      ),
    );
  }
}
