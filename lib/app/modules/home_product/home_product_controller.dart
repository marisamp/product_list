import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mimi_select_product_list_project/app/core/constant.dart';
import 'package:mimi_select_product_list_project/app/core/widgets/error_widget.dart'
    show showErrorDialog;
import 'package:mimi_select_product_list_project/app/data/model/product_data_model.dart';
import 'package:mimi_select_product_list_project/app/data/service/product_service.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class HomeController extends GetxController {
  final ProductDataService _service = ProductDataService();
  final RefreshController refreshController =
      RefreshController(initialRefresh: false);
  final ScrollController scrollController = ScrollController();

  var productList = <Product>[].obs;
  var isLoading = true.obs; // โหลดครั้งแรก/Refresh
  var isMoreLoading = false.obs; // โหลดเพิ่ม
  var hasMore = true.obs; // เช็กข้อมูลว่าหมดหรือยัง
  var backToTop = false.obs; // ปุ่มกลับไปบนสุด

  int limit = 10;

  @override
  void onInit() {
    super.onInit();
    loadProducts();

    scrollController.addListener(() {
      backToTop.value = scrollController.offset > 500;
    });
  }

  // --- กลับไปบนสุด ---
  void scrollToTop() {
    scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  // --- โหลดครั้งแรก/Refresh ---
  Future<void> loadProducts() async {
    try {
      if (productList.isEmpty) isLoading(true);

      var data = await _service.fetchProducts(limit: limit, skip: 0);

      if (data == null) {
        refreshController.refreshFailed();
        showErrorDialog(AppConstant.errorMsgConnection);
        return;
      }

      if (data.products != null) {
        productList.assignAll(data.products!);

        hasMore.value = productList.length < (data.total ?? 0);

        refreshController.refreshCompleted();
        if (!hasMore.value) {
          refreshController.loadNoData();
        } else {
          refreshController.resetNoData();
        }
      }
    } catch (e) {
      log("Error in getInitialProducts: $e");
      refreshController.refreshFailed();
      showErrorDialog(AppConstant.errorMsgGeneral);
    } finally {
      isLoading(false);
    }
  }

  // --- โหลดเพิ่ม (Load More / Pull Up) ---
  Future<void> loadMoreProducts() async {
    if (!hasMore.value) {
      refreshController.loadNoData();
      return;
    }

    try {
      var data = await _service.fetchProducts(
        limit: limit,
        skip: productList.length,
      );

      if (data == null) {
        refreshController.loadFailed();
        return;
      }

      if (data.products != null) {
        if (data.products!.isEmpty) {
          hasMore.value = false;
          refreshController.loadNoData();
        } else {
          productList.addAll(data.products!);
          hasMore.value = productList.length < (data.total ?? 0);

          if (!hasMore.value) {
            refreshController.loadNoData();
          } else {
            refreshController.loadComplete();
          }
        }
      }
    } catch (e) {
      log("Error in loadMoreProducts: $e");
      refreshController.loadFailed();
      showErrorDialog(AppConstant.errorMsgConnection);
    }
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}
