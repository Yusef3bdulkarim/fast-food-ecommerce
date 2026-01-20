import 'package:ecommerce_app_food/core/network/api_serveces.dart';
import 'package:ecommerce_app_food/core/network/dio_client.dart';
import 'package:ecommerce_app_food/core/utils/constans_app.dart';
import 'package:ecommerce_app_food/features/CartScreens/data/repo/cart_repo.dart';
import 'package:ecommerce_app_food/features/auth/models/repo/auth_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ServiceLocator {
  static late SharedPreferences sharedPreferences;
  static late CartRepo cartRepo;
  static late AuthRepo authRepo;

  static late ApiServices apiServices;

  static late DioClient dioClient;
  static Future<void> init() async {
    dioClient = DioClient(appBaseUrl: ConstantsApp.baseUrl);
    apiServices = ApiServices(dioClient);
    sharedPreferences = await SharedPreferences.getInstance();
    cartRepo = CartRepo(sharedPreferences: sharedPreferences);
    authRepo = AuthRepo(
      apiServices: apiServices,
      sharedPreferences: sharedPreferences,
    );
  }
}
