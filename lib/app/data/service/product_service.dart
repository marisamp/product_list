import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:mimi_select_product_list_project/app/core/constant.dart';
import 'package:mimi_select_product_list_project/app/core/network/dio_client.dart';
import 'package:mimi_select_product_list_project/app/data/model/product_data_model.dart';

class ProductDataService {
  final Dio _dio = DioClient.instance;

  Future<ProductDataModel?> fetchProducts({
    int limit = 10,
    int skip = 0,
  }) async {
    try {
      final response = await _dio.get(
        AppConstant.productPath,
        queryParameters: {'limit': limit, 'skip': skip},
      );

      return ProductDataModel.fromJson(response.data);
    } catch (e) {
      log("Error in ProductDataService: $e");
      return null;
    }
  }
}
