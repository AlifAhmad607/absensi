import 'package:get/get.dart';
import 'package:latihan1/controller/tablepremierecontroller.dart';

class Tablepremierebinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<PremiereController>(() => PremiereController());
  }
}