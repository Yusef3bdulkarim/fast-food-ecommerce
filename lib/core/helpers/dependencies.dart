import 'package:ecommerce_app_food/core/network/api_serveces.dart';
import 'package:ecommerce_app_food/core/utils/constans_app.dart';
import 'package:ecommerce_app_food/features/homeScreen/data/repo/repo_recommended.dart';
import 'package:ecommerce_app_food/features/homeScreen/logic/controller_popularProduct.dart';
import 'package:ecommerce_app_food/core/network/dio_client.dart';
import 'package:ecommerce_app_food/features/homeScreen/data/repo/repo_popularProduct.dart';
import 'package:ecommerce_app_food/features/homeScreen/logic/controller_recommend.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart' as getx;

Future<void> init() async {
  Get.lazyPut(() => DioClient(appBaseUrl: ConstantsApp.baseUrl));
  Get.lazyPut(() => ApiServices(getx.Get.find<DioClient>()));
  Get.lazyPut(() => RepoPopularproduct(apiServices: Get.find()));
  Get.lazyPut(() => RepoRecommendedproduct(apiServices: Get.find()));
  Get.lazyPut(() => ControllerFood(repoPopularproduct: Get.find()));
  Get.lazyPut(() => ControllerRecommended(repoRecommendedproduct: Get.find()));
}
