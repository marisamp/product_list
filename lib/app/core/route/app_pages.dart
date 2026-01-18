import 'package:get/get.dart';
import 'package:mimi_select_product_list_project/app/core/network/no_internet_view.dart';
import 'package:mimi_select_product_list_project/app/core/route/app_routes.dart';
import 'package:mimi_select_product_list_project/app/modules/home_product/home_view.dart';
import 'package:mimi_select_product_list_project/app/modules/product_detail/product_detail_view.dart';
import 'package:mimi_select_product_list_project/app/modules/splash/splash_view.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.splash,
      page: () =>  SplashView(),
      transition: Transition.fadeIn, 
    ),
    GetPage(
      name: AppRoutes.noInernet,
      page: () =>  NoInternetView(),
      transition: Transition.fadeIn, 
    ),
    GetPage(
      name: AppRoutes.home,
      page: () =>  HomeView(),
      transition: Transition.fadeIn, 
    ),
    GetPage(
      name: AppRoutes.detail,
      page: () =>  ProductDetailView(),
      transition: Transition.fadeIn, 
    ),
  ];
}