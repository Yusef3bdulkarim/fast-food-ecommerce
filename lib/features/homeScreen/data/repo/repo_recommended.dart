import 'package:dio/dio.dart';
import 'package:ecommerce_app_food/core/network/api_error.dart';
import 'package:ecommerce_app_food/core/network/api_exeption.dart';
import 'package:ecommerce_app_food/core/network/api_serveces.dart';
import 'package:ecommerce_app_food/core/utils/constans_app.dart';
import 'package:ecommerce_app_food/core/network/dio_client.dart';
import 'package:ecommerce_app_food/features/homeScreen/data/models/model_foodApp.dart';
import 'package:get/get.dart';

class RepoRecommendedproduct {
  final ApiServices apiServices;
  RepoRecommendedproduct({required this.apiServices});

  Future<List<ProductModel>> getRecommendedFoodList() async {
    try {
      final response = await apiServices.getData(
        ConstantsApp.recommendedPopularUrl,
      );
      if (response.statusCode == 200) {
        var data = response.data['products'] as List;
        return data.map((item) => ProductModel.fromJson(item)).toList();
      } else {
        throw Exception("فشل في جلب البيانات");
      }
    } on DioException catch (e) {
      throw ApiException.handleError(e);
    } catch (e) {
      throw ApiError(message: e.toString());
    }
  }
}
