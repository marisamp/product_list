import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mimi_select_product_list_project/app/core/app_style/app_colors.dart';
import 'package:mimi_select_product_list_project/app/core/app_style/app_text.dart';
import 'package:mimi_select_product_list_project/app/core/constant.dart';
import 'package:mimi_select_product_list_project/app/core/widgets/appbar_widget.dart';
import 'package:mimi_select_product_list_project/app/core/widgets/bottomnav_widget.dart';
import 'package:mimi_select_product_list_project/app/core/widgets/error_widget.dart';
import 'package:mimi_select_product_list_project/app/core/widgets/loading_widget.dart';
import 'package:mimi_select_product_list_project/app/modules/home_product/home_product_controller.dart';
import 'package:mimi_select_product_list_project/app/modules/home_product/widgets/load_refresh_widget.dart';
import 'package:mimi_select_product_list_project/app/modules/home_product/widgets/producrt_card.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  var controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppbarWidget(),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppConstant.defaulthoriPadding,
          vertical: AppConstant.defaultveriPadding,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText.title("DISCOVER ALL"),
            SizedBox(height: 10.h),
            Expanded(
              child: Obx(() {
                if (controller.isLoading.value) {
                  return LoadingCircleWidget(color: AppColors.primaryRedColor);
                }
                if (controller.productList.isEmpty) {
                  return NoData(onPressed: () => controller.loadProducts());
                }
                return SmartRefresher(
                  controller: controller.refreshController,
                  scrollController: controller.scrollController,
                  enablePullDown: true,
                  enablePullUp: true,
                  onRefresh: controller.loadProducts,
                  onLoading: controller.loadMoreProducts,
                  header: loadRefreshWidget(),
                  footer: loadmoreWidget(),
                  child: ListView.builder(
                    itemCount: controller.productList.length,
                    itemBuilder: (context, index) {
                      return ProducrtCardWidget(
                        productdata: controller.productList[index],
                      );
                    },
                  ),
                );
              }),
            ),
          ],
        ),
      ),
      floatingActionButton: Obx(() => controller.backToTop.value
          ? FloatingActionButton(
              backgroundColor: AppColors.primaryRedColor,
              foregroundColor: AppColors.whiteColor,
              onPressed: () => controller.scrollToTop(),
              mini: true,
              child: Icon(Icons.arrow_upward, color: AppColors.whiteColor),
            )
          : const SizedBox.shrink()),
      bottomNavigationBar: BottomNavWidget(),
    );
  }
}
