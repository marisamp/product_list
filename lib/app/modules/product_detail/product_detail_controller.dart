import 'dart:developer';

import 'package:get/get.dart';
import 'package:mimi_select_product_list_project/app/data/model/product_data_model.dart';

import '../../data/service/product_service.dart';

class ProductDetailController extends GetxController {
  final ProductDataService service = ProductDataService();

  var product = Product().obs;
  var isLoading = true.obs;
  int? currentId;
  var selectedImageIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null) {
      currentId = Get.arguments as int;
      fetchProductDetail(currentId);
    }
  }

  Future<void> fetchProductDetail(int? id) async {
    if (id == null) return;

    try {
      isLoading(true);
      var data = await service.getproductbyId(id: id);
      product.value = data;
    } catch (e) {
      log("Error: $e");
    } finally {
      isLoading(false);
    }
  }

  void changeSelectedImage(int index) {
    selectedImageIndex.value = index;
  }
}
