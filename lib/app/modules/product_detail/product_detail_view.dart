import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mimi_select_product_list_project/app/core/app_style/app_colors.dart';
import 'package:mimi_select_product_list_project/app/core/widgets/appbar_widget.dart';
import 'package:mimi_select_product_list_project/app/core/widgets/bottomnav_widget.dart';
import 'package:mimi_select_product_list_project/app/modules/product_detail/product_detail_controller.dart';

class ProductDetailView extends StatefulWidget {
  const ProductDetailView({super.key});

  @override
  State<ProductDetailView> createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends State<ProductDetailView> {
  var controller = Get.put(ProductDetailController());
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppbarWidget(),
      body: Column(children: [Text(controller.id.toString())],),
      bottomNavigationBar: BottomNavWidget(),
    );
  }
}