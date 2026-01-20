import 'package:dio/dio.dart';
import 'package:ecommerce_app_food/core/network/api_error.dart';
import 'package:ecommerce_app_food/core/network/api_exeption.dart';
import 'package:ecommerce_app_food/core/network/dio_client.dart';

class ApiServices {
  final DioClient _dioClient;
  DioClient get dioClient => _dioClient;

  ApiServices(this._dioClient);

  Future<Response> getData(String url) async {
    try {
      Response response = await _dioClient.dio.get(url);
      return response;
    } on DioException catch (e) {
      // بنعمل throw عشان الـ Repository يحس إن فيه مشكلة
      throw ApiException.handleError(e);
    } catch (e) {
      throw ApiError(message: e.toString());
    }
  }

  Future<Response> postData(String url, Map<String, dynamic> body) async {
    try {
      Response response = await _dioClient.dio.post(url, data: body);
      return response;
    } on DioException catch (e) {
      throw ApiException.handleError(e);
    } catch (e) {
      throw ApiError(message: e.toString());
    }
  }
}
