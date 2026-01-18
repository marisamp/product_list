import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

class NetworkController extends GetxController {
  var isConnected = true.obs;
  var isChecking = false.obs;

  @override
  void onInit() {
    super.onInit();
    _monitorConnection();
  }

  void _monitorConnection() {
    Connectivity().onConnectivityChanged.listen((results) {
      isConnected.value = !results.contains(ConnectivityResult.none);
    });
  }

  // กดเช็ค internet
  Future<void> checkConnection() async {
    isChecking.value = true; // เริ่มหมุน

    await Future.delayed(const Duration(milliseconds: 800));

    var results = await Connectivity().checkConnectivity();
    isConnected.value = !results.contains(ConnectivityResult.none);

    isChecking.value = false; 
  }
}
