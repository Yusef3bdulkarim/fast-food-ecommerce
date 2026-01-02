import 'package:dio/dio.dart';
import 'package:ecommerce_app_food/core/network/api_error.dart';

class ApiException {
  static ApiError handleError(DioError error) {
    switch (error.type) {
      case DioErrorType.connectionTimeout:
        return ApiError(message: "bad connection");
      case DioExceptionType.sendTimeout:
        return ApiError(message: "bad sendTime");
      case DioExceptionType.receiveTimeout:
        return ApiError(message: "bad receiveTimeout");
      case DioExceptionType.badCertificate:
        return ApiError(message: "badCertificate");
      case DioExceptionType.badResponse:
        return ApiError(message: "badResponse");
      case DioExceptionType.cancel:
        return ApiError(message: "cancel");
      case DioExceptionType.connectionError:
        return ApiError(message: "connectionError");
      case DioExceptionType.unknown:
        return ApiError(message: "unknownn");
    }
  }
}
