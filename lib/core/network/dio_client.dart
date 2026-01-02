// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:get/get.dart' as getx;

class DioClient extends getx.GetxService {
  // final String baseUrl = "https://mvs.bslmeiyu.com/api/";
  final String appBaseUrl;
  final String token = "YOUR_TOKEN_HERE";
  late Dio dio;
  DioClient({required this.appBaseUrl}) {
    dio = Dio(
      BaseOptions(
        baseUrl: appBaseUrl,
        connectTimeout: Duration(seconds: 30),
        receiveTimeout: Duration(seconds: 30),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
      ),
    );
  }
  // Future<Response> getData(String url) async {
  //   try {
  //     Response response = await dio.get(url);
  //     return response;
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
}
