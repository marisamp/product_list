import 'package:get/get.dart';
import 'package:mimi_select_product_list_project/app/data/model/product_data_model.dart';

class ProductDetailController extends GetxController {
  // final ProductDataService _service = ProductDataService();
  
  var product = Product().obs; // ใช้ .obs เพราะต้องรอข้อมูลจาก API
  var isLoading = true.obs;
  var id = 0.obs;

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null) {
      int productId = Get.arguments as int;
      id.value = productId;
      // fetchProductDetail(productId);
    }
  }

  // Future<void> fetchProductDetail(int id) async {
  //   try {
  //     isLoading(true);
  //     // สมมติว่าใน Service มีฟังก์ชัน getProductById นะครับ
  //     var data = await _service.getProductById(id); 
  //     if (data != null) {
  //       product.value = data;
  //     }
  //   } catch (e) {
  //     log("Error: $e");
  //   } finally {
  //     isLoading(false);
  //   }
  // }
}