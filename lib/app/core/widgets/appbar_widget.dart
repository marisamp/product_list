import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mimi_select_product_list_project/app/core/app_style/app_colors.dart';
import 'package:mimi_select_product_list_project/app/core/app_style/app_text.dart';
import 'package:mimi_select_product_list_project/app/core/constant.dart';
import 'package:mimi_select_product_list_project/app/core/route/app_routes.dart';

class AppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primaryRedColor,
      title: AppText.title(AppConstant.appName, color: AppColors.whiteColor),
      elevation: 2,
      leading: InkWell(
        onTap: () => Get.toNamed(AppRoutes.home),
        hoverColor: AppColors.secondryRedColor,
        overlayColor: WidgetStatePropertyAll(AppColors.secondryRedColor),
        splashColor: AppColors.secondryRedColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            AppConstant.logoApp,
            fit: BoxFit.contain, 
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
