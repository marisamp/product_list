import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mimi_select_product_list_project/app/core/app_style/app_colors.dart';
import 'package:mimi_select_product_list_project/app/core/app_style/app_text.dart';
import 'package:mimi_select_product_list_project/app/core/constant.dart';

class RowtxtWidget extends StatelessWidget {
  final String txt1;
  final String txt2;
  const RowtxtWidget({
    super.key,
    required this.txt1,
    required this.txt2,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(bottom: 2),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: AppColors.primaryRedColor,
                width: 2.0,
              ),
            ),
          ),
          child: AppText(
            txt1,
            fontSize: 14.sp,
            color: AppColors.primaryRedColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        AppText(
          txt2,
          fontSize: 10.sp,
          color: AppColors.grayColor,
        ),
      ],
    );
  }
}

class RowCardtxtWidget extends StatelessWidget {
  final String txt1;
  final IconData icon1;
  final String txt2;
  final IconData icon2;
  const RowCardtxtWidget({
    super.key,
    required this.txt1,
    required this.txt2,
    required this.icon1,
    required this.icon2,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.blueColor,
            borderRadius: BorderRadius.all(
              Radius.circular(AppConstant.cardRadius),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  icon1,
                  color: AppColors.yellowColor,
                  size: 20.sp,
                ),
                AppText(txt1, fontSize: 12.sp),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icon2,
                color: AppColors.okColor,
                size: 20.sp,
              ),
              SizedBox(width: 5.w),
              AppText(txt2, fontSize: 12.sp),
            ],
          ),
        ),
      ],
    );
  }
}

class CardContent extends StatelessWidget {
  final String txt1;
  final String txt2;

  const CardContent({
    super.key,
    required this.txt1,
    required this.txt2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.pinkColor,
        borderRadius: BorderRadius.all(Radius.circular(10.r)),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(txt1, fontSize: 12.sp),
            SizedBox(height: 5.h),
            Container(
              width: 50.w,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: AppColors.secondryRedColor,
                    width: 2.0,
                  ),
                ),
              ),
            ),
            SizedBox(height: 5.h),
            AppText(txt2, fontSize: 12.sp),
          ],
        ),
      ),
    );
  }
}

class CardReviewMore extends StatelessWidget {
  final String txt1;
  final String txt2;
  final String txt3;
  final String txt4;

  const CardReviewMore({
    super.key,
    required this.txt1,
    required this.txt2,
    required this.txt3,
    required this.txt4,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.all(Radius.circular(10.r)),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(txt1, fontSize: 12.sp),
            SizedBox(height: 5.h),
            Container(
              width: 50.w,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: AppColors.pinkColor,
                    width: 2.0,
                  ),
                ),
              ),
            ),
            SizedBox(height: 5.h),
            AppText(txt2, fontSize: 12.sp),
            SizedBox(height: 5.h),
            AppText(txt3, fontSize: 12.sp),
            SizedBox(height: 5.h),
            AppText(txt4, fontSize: 12.sp),
            SizedBox(height: 5.h),
          ],
        ),
      ),
    );
  }
}
