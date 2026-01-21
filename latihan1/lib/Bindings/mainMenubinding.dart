import 'package:get/get.dart';
import 'package:latihan1/Bindings/tablepremierebinding.dart';
import 'package:latihan1/controller/footballcontroller.dart';
import 'package:latihan1/controller/navcontroller.dart';
import 'package:latihan1/controller/profilecontroller.dart';
import 'package:latihan1/pages/footballpage.dart';


class Mainmenubindings extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
     Get.lazyPut<Tablepremierebinding>(()=>Tablepremierebinding());
     Get.lazyPut<ProfileController>(()=>ProfileController());
     Get.lazyPut<NavController>(()=>NavController());
      
  }
  
}