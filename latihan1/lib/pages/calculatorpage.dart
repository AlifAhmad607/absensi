import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:latihan1/controller/calculatorcontroller.dart';
import 'package:latihan1/pages/footballpage.dart';
import 'package:latihan1/reusable/custombutton.dart';

class CalculatorPage extends StatelessWidget {
  
  final String hasil;
  CalculatorPage({super.key, required this.hasil});

  final CalculatorController calculatorController = Get.put(
    CalculatorController(),
  );

  // final calculatorController = Get.find<CalculatorController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(title: Text("Calculator")),
      body: Container(
        child: Column(
          children: [
            TextField(
              
              controller: calculatorController.txtangka1,
            ),
            TextField(
              
              controller: calculatorController.txtangka2,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    textColor: Colors.white,
                    text: "+",
                    press: calculatorController.tambah,
                    color: const Color.fromARGB(255, 0, 94, 255),
                  ),
                  SizedBox(width: 10),
                  CustomButton(
                    textColor: Colors.white,
                    text: "-",
                    press: calculatorController.kurang,
                    color: const Color.fromARGB(255, 0, 94, 255),
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    textColor: Colors.white,
                    text: "x",
                    press: calculatorController.kali,
                    color: const Color.fromARGB(255, 0, 94, 255),
                  ),
                  SizedBox(width: 10),
                  CustomButton(
                    textColor: Colors.white,
                    text: "/",
                    press: calculatorController.bagi,
                    color: const Color.fromARGB(255, 0, 94, 255),
                  ),
                ],
              ),
            ),
            Obx(() {
              return Text(
                'hasil: ' + calculatorController.hasil.value.toString(),
              );
            }),
            SizedBox(height: 20),
            CustomButton(
              textColor: Colors.white,
              text: "clear",
              press: calculatorController.clear,
              color: const Color.fromARGB(255, 255, 68, 68),
            ),
            CustomButton(
              textColor: Colors.white,
              text: "FootbalPlayer",
              press: (){
                Get.to(()=> Footballpage());
              },
              color: Colors.blueAccent,
            ),
          ],
        ),
      ),
    );
  }
}