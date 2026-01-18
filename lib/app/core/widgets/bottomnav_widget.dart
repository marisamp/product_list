import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mimi_select_product_list_project/app/core/app_style/app_colors.dart';
import 'package:mimi_select_product_list_project/app/core/app_style/app_text.dart';
import 'package:mimi_select_product_list_project/app/core/constant.dart'
    show AppConstant;

class BottomNavWidget extends StatelessWidget {
  const BottomNavWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        width: double.infinity,
        color: AppColors.blackColor,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppConstant.defaulthoriPadding,
            vertical: AppConstant.defaultveriPadding,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                AppConstant.appName,
                color: AppColors.whiteColor,
                fontSize: 12.sp,
              ),
              SizedBox(height: 5.h),
                AppText(
                AppConstant.copyright,
                color: AppColors.whiteColor,
                fontSize: 12.sp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
