import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mimi_select_product_list_project/app/core/app_style/app_colors.dart';
import 'package:mimi_select_product_list_project/app/core/network/network_controller.dart';
import 'package:mimi_select_product_list_project/app/core/network/no_internet_view.dart';
import 'package:mimi_select_product_list_project/app/core/route/app_pages.dart';
import 'package:mimi_select_product_list_project/app/core/route/app_routes.dart';
import 'package:mimi_select_product_list_project/app/core/constant.dart';

void main() {
  Get.put(NetworkController(), permanent: true);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp(
          title: AppConstant.appName,
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoutes.splash,
          getPages: AppPages.pages,
          theme: ThemeData(
            fontFamily: AppConstant.fontFamily,
            colorScheme:
                ColorScheme.fromSeed(seedColor: AppColors.primaryRedColor),
          ),
          builder: (context, child) {      
            return Obx(() {
              final networkController = Get.find<NetworkController>();
              return Stack(
                children: [
                  child!, 
                  if (!networkController.isConnected.value)
                    const NoInternetView(),
                ],
              );
            });
          },
        );
      },
    );
  }
}
