import 'package:get/get.dart';
import 'package:latihan1/Routes/Approutes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashscreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    checklogin();
  }

  checklogin() async {
    await Future.delayed(Duration(seconds: 3));
    final prefs = await SharedPreferences.getInstance();

    // Cek token, bukan username
    if (prefs.getString("token") != null) {
      Get.offAllNamed(Approutes.homepage);
    } else {
      Get.offAllNamed(Approutes.loginApi);
    }
  }
}