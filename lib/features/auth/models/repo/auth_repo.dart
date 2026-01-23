import 'package:ecommerce_app_food/core/network/api_error.dart';
import 'package:ecommerce_app_food/core/network/api_serveces.dart';
import 'package:ecommerce_app_food/core/utils/constans_app.dart';
import 'package:ecommerce_app_food/features/auth/models/data/model_body_auth.dart';
import 'package:ecommerce_app_food/features/auth/models/data/model_body_loginIn.dart';
import 'package:ecommerce_app_food/features/auth/models/data/model_body_profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepo {
  final ApiServices apiServices;
  final SharedPreferences sharedPreferences;

  AuthRepo({required this.apiServices, required this.sharedPreferences});

  Future<void> register(ModelBodyAuth modelBodyAuth) async {
    try {
      final response = await apiServices.postData(
        ConstantsApp.authUrl,
        modelBodyAuth.toMap(),
      );

      if (response.data['token'] != null) {
        sharedPreferences.setString(
          ConstantsApp.tokenKey,
          response.data['token'],
        );
      }
    } catch (e) {
      throw ApiError(message: e.toString());
    }
  }

  Future<bool> login(LoginBodyModel loginBodyModel) async {
    try {
      final response = await apiServices.postData(
        ConstantsApp.loginUrl,
        loginBodyModel.toMap(),
      );

      // التحقق: هل الـ Response فيه داتا؟ وهل الـ Token موجود؟
      if (response.statusCode == 200 && response.data['token'] != null) {
        await sharedPreferences.setString(
          ConstantsApp.tokenKey,
          response.data['token'],
        );

        if (response.data['phone'] != null) {
          await sharedPreferences.setString(
            ConstantsApp.phoneKey,
            response.data['phone'].toString(),
          );
        }
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw ApiError(message: "Invalid phone or password");
    }
  }

  Future<ModelBodyProfile> getDataInfo() async {
    try {
      final response = await apiServices.getData(ConstantsApp.pofileUrl);
      return ModelBodyProfile.fromJson(response.data);
    } catch (e) {
      throw ApiError(message: "Failed to load profile data");
    }
  }

  Future<void> logOut() async {
    await sharedPreferences.remove(ConstantsApp.tokenKey);
    apiServices.dioClient.dio.options.headers.remove('Authorization');
    await sharedPreferences.remove(ConstantsApp.phoneKey);
    await sharedPreferences.remove(ConstantsApp.cartListKey);
    await sharedPreferences.remove(ConstantsApp.imageKey);
    await sharedPreferences.remove(ConstantsApp.addressKey);
  }
}
