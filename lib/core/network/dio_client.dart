import 'package:dio/dio.dart';

class DioClient {
  final String appBaseUrl;
  late Dio dio;

  DioClient({required this.appBaseUrl}) {
    dio = Dio(
      BaseOptions(
        baseUrl: appBaseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          // 'Authorization': 'Bearer YOUR_TOKEN', // يفضل إضافته في Interceptor لاحقاً
        },
      ),
    );
  }
}
