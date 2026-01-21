import 'package:get/get.dart';
import 'package:latihan1/controller/calculatorcontroller.dart';

class Calculatorbinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<CalculatorController>(()=>CalculatorController());
  }
  
}