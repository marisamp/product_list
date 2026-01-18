import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mimi_select_product_list_project/app/core/app_style/app_colors.dart';
import 'package:mimi_select_product_list_project/app/core/app_style/app_text.dart';
import 'package:mimi_select_product_list_project/app/core/network/network_controller.dart';
import 'package:mimi_select_product_list_project/app/core/constant.dart';

class NoInternetView extends StatelessWidget {
  const NoInternetView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<NetworkController>();

    return Scaffold(
      backgroundColor: AppColors.primaryRedColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20.h),
            Container(
              width: AppConstant.imgWLogoSize,
              height: AppConstant.imgWLogoSize,
              decoration: BoxDecoration(
                color: AppColors.whiteColor, 
                borderRadius: BorderRadius.circular(AppConstant.logoRadius),
              ),
              child: Padding(
                padding: EdgeInsets.all(AppConstant.defaulthoriPadding), 
                child: Image.asset(
                  AppConstant.noWifi,
                  fit: BoxFit.contain, 
                ),
              ),
            ),
         SizedBox(height: 20.h),
            AppText.title(AppConstant.errorMsg, color: AppColors.whiteColor),
            AppText(
                AppConstant.errorMsgConnection,
                color: AppColors.whiteColor,
                textAlign: TextAlign.center,
              ),
            SizedBox(height: 20.h),
            Obx(
              () => ElevatedButton.icon(
                onPressed: controller.isChecking.value
                    ? null
                    : () => controller.checkConnection(),
                icon: controller.isChecking.value
                    ? SizedBox(
                        width: 20.w,
                        height: 20.h,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: AppColors.primaryRedColor,
                        ),
                      )
                    : Icon(
                        Icons.refresh,
                        size: AppConstant.iconsize,
                        color: AppColors.primaryRedColor,
                      ),
                label: AppText.body(
                  controller.isChecking.value
                      ? AppConstant.loadingCheck
                      : AppConstant.loadingfalse,
                  color: AppColors.primaryRedColor,
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.whiteColor,
                  foregroundColor: AppColors.grayColor,
                  padding: EdgeInsets.symmetric(
                    horizontal: AppConstant.defaulthoriPadding,
                    vertical: AppConstant.defaultveriPadding,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }
}
