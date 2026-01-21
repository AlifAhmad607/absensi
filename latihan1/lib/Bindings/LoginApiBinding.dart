import 'package:get/get.dart';
import 'package:latihan1/controller/LoginApiController.dart';


class LoginAPIBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginAPIController>(() => LoginAPIController());
  }
}
