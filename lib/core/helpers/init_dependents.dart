import 'package:ecommerce_app_food/features/CartScreens/data/repo/cart_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ServiceLocator {
  static late SharedPreferences sharedPreferences;
  static late CartRepo cartRepo;
  static Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    cartRepo = CartRepo(sharedPreferences: sharedPreferences);
  }
}
