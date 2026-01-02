import 'package:ecommerce_app_food/features/details/UI/screens/details_screen.dart';
import 'package:ecommerce_app_food/features/homeScreen/UI/screens/home_page.dart';
import 'package:ecommerce_app_food/features/RecommendedScreen/UI/screens/ingredient_screen.dart';
import 'package:get/get.dart';

class RoutingHelper {
  static const String initialScreen = "/";
  static const String popularProductScreen = "/popularProduct";
  static const String recommendedProductScreen = "/recommendedProduct";

  static String getInitialScreen() => "$initialScreen";
  static String getPopularProductScreen(int idPopular) =>
      "$popularProductScreen?idPopular=$idPopular";
  static String getRecommendedProductScreen(int idPopular) =>
      "$recommendedProductScreen?idPopular=$idPopular";

  static List<GetPage> routers = [
    GetPage(name: initialScreen, page: () => HomePage()),
    GetPage(
      name: popularProductScreen,
      page: () {
        var idPopular = Get.parameters['idPopular'];
        return DetailsScreen(idPopular: int.parse(idPopular!));
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: recommendedProductScreen,
      page: () {
        var idPopular = Get.parameters['idPopular'];
        return IngredientScreen(idPopular: int.parse(idPopular!));
      },
      transition: Transition.fadeIn,
    ),
  ];
}
