import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppConstant {
  // --- API Endpoint ---
  static const String baseUrl = 'https://dummyjson.com';
  static const String productPath = '/products';

  // --- Image Paths  ---
  static const String imagePath = 'assets/image';
  static const String iconPath = 'assets/icon';
  static const String logoApp = 'assets/icon/icon_app.png';
  static const String noImg = 'assets/image/no-picture.png';
  static const String noWifi = 'assets/image/no-wifi.png';

  // --- ค่าคงที่ต่างๆในแอป ---
  static double get defaulthoriPadding => 20.w;
  static double get defaultveriPadding => 10.h;
  static double get cardRadius => 20.r;
  static double get logoRadius => 50.r;
  static double get imgWLogoSize => 120.w;
  static double get imgHLogoSize => 120.h;
  static double get iconsize => 30.sp;
  static double get iconsize2 => 20.sp;
  static double get iconLoadingsize => 80.sp;

  // --- ข้อความที่ใช้บ่อย ---
  static const String fontFamily = 'Mitr';
  static const String appName = 'MiMi SELECT';
  static const String appDesc =
      'A high-quality product showcase application powered by Flutter and REST API.';
  static const String copyright = '© 2026 Developed by Marisa Ph.';
  static const String loadingCheck = 'Checking...';
  static const String loadingfalse = 'Try Again';
  static const String nodata = 'No Information';
  static const String success = 'Success';
  static const String successMsgConnection = 'Internet connection established.';
  static const String errorMsg = 'Error';
  static const String errorMsgConnection =
      'Please check your internet connection.';
  static const String errorMsgImage = 'Unable to load image.';
  static const String errorMsgGeneral =
      'Something went wrong. Please try again later.';
  static const String oktext = 'OK';
  static const String canceltext = 'Cancel';
  static const String noProduct = 'Product information not found';
  static const String pullToRefresh = 'Pull down to refresh';
  static const String releaseToRefresh = 'Release to refresh';
  static const String pullUpToLoad = 'Pull up to load more';
  static const String releaseToLoad = 'Release to load more';
  static const String loading = 'Loading...';
  static const String noMoreData = '--- No more products ---';
  static const String loadFailed = 'Load failed. Please try again.';
  static const String notsupport = 'This app is optimized for mobile only.';
  static const String backbtn = 'BACK';
}
