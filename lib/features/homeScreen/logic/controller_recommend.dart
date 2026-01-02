import 'package:ecommerce_app_food/features/homeScreen/data/repo/repo_popularProduct.dart';
import 'package:ecommerce_app_food/features/homeScreen/data/repo/repo_recommended.dart';
import 'package:get/get.dart';

class ControllerRecommended extends GetxController {
  final RepoRecommendedproduct repoRecommendedproduct;
  ControllerRecommended({required this.repoRecommendedproduct});
  List<dynamic> _newList = [];
  List<dynamic> get newList => _newList;
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> getRecommendedList() async {
    update();
    try {
      _newList = await repoRecommendedproduct.getRecommendedFoodList();
    } catch (e) {
      print(" ${e}المشكله اهيي ");
    } finally {
      _isLoading = true;
      update();
    }
  }

  @override
  void onInit() {
    super.onInit();
    getRecommendedList();
  }
}
