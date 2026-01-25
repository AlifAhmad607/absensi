import 'package:get/get.dart';
import 'package:latihan1/controller/absensi_controller.dart';
import 'package:latihan1/controller/navbar_controller.dart';
import 'package:latihan1/services/absensi_service.dart';

class AbsensiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AbsensiService>(() => AbsensiService());
    Get.lazyPut<AbsensiController>(() => AbsensiController(service: Get.find<AbsensiService>()),);
    Get.lazyPut<NavbarController>(() => NavbarController());
  }
}