import 'package:get/get.dart';
import 'package:latihan1/controller/SplashScreenContrroller.dart';
class Splashscreenbinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<SplashscreenController>(() => SplashscreenController());
  }
}