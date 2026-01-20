import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mimi_select_product_list_project/app/core/app_style/app_colors.dart';
import 'package:mimi_select_product_list_project/app/core/app_style/app_text.dart';
import 'package:mimi_select_product_list_project/app/core/constant.dart';

class GobackBtn extends StatelessWidget {
  const GobackBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => Get.back(),
      style: ButtonStyle(
        elevation: WidgetStatePropertyAll(3),
        backgroundColor: WidgetStatePropertyAll(
          AppColors.primaryRedColor,
        ),
        foregroundColor: WidgetStatePropertyAll(
          AppColors.whiteColor,
        ),
      ),
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 5.w,vertical: 10.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.arrow_back_ios, size: AppConstant.iconsize2),
            SizedBox(width: 5.w),
            AppText(AppConstant.backbtn),
          ],
        ),
      ),
    );
  }
}
