import 'package:dio/dio.dart';
import 'package:ecommerce_app_food/core/network/api_error.dart';
import 'package:ecommerce_app_food/core/network/api_exeption.dart';
import 'package:ecommerce_app_food/core/network/api_serveces.dart';
import 'package:ecommerce_app_food/core/utils/constans_app.dart';
import 'package:ecommerce_app_food/features/HomeScreens/data/models/model_foodApp.dart';

class RepoRecommendedproduct {
  final ApiServices apiServices;

  // Constructor يستقبل الـ apiServices (حقن تبعيات)
  RepoRecommendedproduct({required this.apiServices});

  Future<List<ProductModel>> getRecommendedFoodList() async {
    try {
      // طلب البيانات من الـ API
      final response = await apiServices.getData(
        ConstantsApp.recommendedPopularUrl,
      );

      // التأكد من نجاح العملية وتحويل البيانات
      if (response.statusCode == 200) {
        final List data = response.data['products'];
        return data.map((item) => ProductModel.fromJson(item)).toList();
      } else {
        // رمي خطأ في حال كان الـ status code غير 200
        throw ApiError(message: "Server Error: ${response.statusCode}");
      }
    } on DioException catch (e) {
      // استخدام الـ Exception المخصص اللي إنت عامله
      throw ApiException.handleError(e);
    } catch (e) {
      // أي خطأ غير متوقع آخر
      throw ApiError(message: "Unexpected Error: ${e.toString()}");
    }
  }
}
