import 'package:dio/dio.dart';
import 'package:ecommerce_app_food/core/network/api_error.dart';
import 'package:ecommerce_app_food/core/network/api_exeption.dart';
import 'package:ecommerce_app_food/core/network/dio_client.dart';
import 'package:ecommerce_app_food/features/homeScreen/data/models/model_foodApp.dart';

class ApiServices {
  final DioClient _dioClient;

  ApiServices(this._dioClient);
  Future<dynamic> getData(String url) async {
    try {
      Response response = await _dioClient.dio.get(url);
      return response;
    } on DioException catch (e) {
      return ApiException.handleError(e);
    } catch (e) {
      return ApiError(message: e.toString());
    }
  }
}
