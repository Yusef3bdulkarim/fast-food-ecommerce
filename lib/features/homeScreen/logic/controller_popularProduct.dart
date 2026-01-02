import 'package:ecommerce_app_food/features/homeScreen/data/repo/repo_popularProduct.dart';
import 'package:get/get.dart';

class ControllerFood extends GetxController {
  final RepoPopularproduct repoPopularproduct;
  ControllerFood({required this.repoPopularproduct});
  List<dynamic> _newList = [];
  List<dynamic> get newList => _newList;
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> getFoodList() async {
    update();
    try {
      _newList = await repoPopularproduct.getPopularFoodList();
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
    getFoodList();
  }
}
