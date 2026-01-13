import 'package:dio/dio.dart';
import 'package:ecommerce_app_food/core/network/api_error.dart';

class ApiException {
  static ApiError handleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return ApiError(message: "Connection Timeout with server");
      case DioExceptionType.sendTimeout:
        return ApiError(message: "Send Timeout");
      case DioExceptionType.receiveTimeout:
        return ApiError(message: "Receive Timeout");
      case DioExceptionType.badResponse:
        // هنا ممكن تجيب رسالة الخطأ اللي راجعة من السيرفر نفسه
        return ApiError(
          message: error.response?.data['message'] ?? "Bad Response",
          stutesCode: error.response?.statusCode,
        );
      case DioExceptionType.connectionError:
        return ApiError(message: "No Internet Connection");
      default:
        return ApiError(message: "Something went wrong!");
    }
  }
}
