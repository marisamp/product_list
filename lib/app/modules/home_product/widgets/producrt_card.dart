// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:mimi_select_product_list_project/app/core/app_style/app_colors.dart';
import 'package:mimi_select_product_list_project/app/core/app_style/app_text.dart';
import 'package:mimi_select_product_list_project/app/core/constant.dart';
import 'package:mimi_select_product_list_project/app/core/route/app_routes.dart';
import 'package:mimi_select_product_list_project/app/core/widgets/error_widget.dart';
import 'package:mimi_select_product_list_project/app/core/widgets/loading_widget.dart';
import 'package:mimi_select_product_list_project/app/data/model/product_data_model.dart';

class ProducrtCardWidget extends StatelessWidget {
  final Product productdata;

  const ProducrtCardWidget({
    super.key,
    required this.productdata,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.all(
            Radius.circular(AppConstant.cardRadius),
          ),
        ),
        child: ListTile(
          minVerticalPadding: 0,
          minLeadingWidth: 0,
          horizontalTitleGap: 12,
          contentPadding: EdgeInsets.all(12),
          leading: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: 100.w,
              maxWidth: 100.w,
              minHeight: 120.h,
              maxHeight: 200.h,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                productdata.thumbnail ?? productdata.images!.first,
                fit: BoxFit.contain,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  }
                  return LoadingMoreWidget();
                },
                errorBuilder: (context, error, stackTrace) {
                  return NoImg();
                },
              ),
            ),
          ),
          title: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.star,
                    color: AppColors.yellowColor,
                    size: AppConstant.iconsize2,
                  ),
                  SizedBox(width: 5),
                  AppText(
                    productdata.rating.toString(),
                    fontSize: 12.sp,
                    color: AppColors.grayColor,
                  ),
                ],
              ),
              SizedBox(height: 4.h),
              AppText(
                productdata.title ?? AppConstant.nodata,
                fontWeight: FontWeight.bold,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
          subtitle: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AppText(
                productdata.category ?? AppConstant.nodata,
                color: AppColors.grayColor,
                fontSize: 12.sp,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 4.h),
              AppText(
                "\$ ${productdata.price ?? AppConstant.nodata}",
                color: AppColors.primaryRedColor,
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
          onTap: () {
            Get.toNamed(AppRoutes.detail, arguments: productdata.id);
          },
        ),
      ),
    );
  }
}
