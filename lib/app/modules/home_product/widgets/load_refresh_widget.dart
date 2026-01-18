import 'package:flutter/material.dart';
import 'package:mimi_select_product_list_project/app/core/app_style/app_colors.dart';
import 'package:mimi_select_product_list_project/app/core/app_style/app_text.dart';
import 'package:mimi_select_product_list_project/app/core/constant.dart';
import 'package:mimi_select_product_list_project/app/core/widgets/loading_widget.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

Widget loadmoreWidget() {
  return CustomFooter(
    builder: (context, mode) {
      Widget body;
      if (mode == LoadStatus.idle) {
        body = AppText(AppConstant.pullUpToLoad);
      } else if (mode == LoadStatus.loading) {
        body = LoadingMoreWidget();
      } else if (mode == LoadStatus.failed) {
         body = AppText(AppConstant.loadFailed);
      } else if (mode == LoadStatus.noMore) {
         body = AppText(AppConstant.noMoreData);
      } else {
        body = AppText(AppConstant.releaseToLoad);
      }
      return SizedBox(height: 55.0, child: Center(child: body));
    },
  );
}

Widget loadRefreshWidget() {
  return WaterDropHeader(
    waterDropColor: AppColors.primaryRedColor,
    refresh: LoadingMoreWidget(),
    complete: Icon(Icons.check, color: AppColors.primaryRedColor,size: AppConstant.iconsize),
  );
}
