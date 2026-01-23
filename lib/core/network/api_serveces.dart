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
      print("API START: Sending to $url");
      Response response = await _dioClient.dio.post(url, data: body);
      return response;
    } on DioException catch (e) {
      print("DIO ERROR DETECTED: ${e.type}");
      if (e.response != null) {
        // هنا السر! السيرفر رد فعلاً بس فيه مشكلة في البيانات
        print("SERVER ERROR BODY: ${e.response?.data}");
        return e.response!; // رجع الرد عشان الكيوبت ميفصلش
      }
      throw e;
    } catch (e) {
      print("GENERAL ERROR IN API_SERVICES: $e");
      rethrow;
    }
  }
}
