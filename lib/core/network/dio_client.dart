import 'package:dio/dio.dart';
import 'package:ecommerce_app_food/core/helpers/init_dependents.dart';
import 'package:ecommerce_app_food/core/utils/constans_app.dart';

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
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          final token = ServiceLocator.sharedPreferences.getString(
            ConstantsApp.tokenKey,
          );

          bool isAuthPath =
              options.path.contains('auth') || options.path.contains('login');

          if (token != null && token.isNotEmpty && !isAuthPath) {
            options.headers['Authorization'] = 'Bearer $token';
          } else {
            // ✅ الخطوة السحرية: لو مفيش توكن، امسح الهيدر القديم تماماً
            options.headers.remove('Authorization');
          }

          return handler.next(options);
        },
      ),
    );

    // dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
  }
}
