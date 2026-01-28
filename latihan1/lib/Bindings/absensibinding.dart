import 'package:get/get.dart';
import 'package:latihan1/controller/absensi_controller.dart';
import 'package:latihan1/controller/navbar_controller.dart';

class AbsensiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AbsensiController>(() => AbsensiController());
    Get.lazyPut<NavbarController>(() => NavbarController());
  }
}