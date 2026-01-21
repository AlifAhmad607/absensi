import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan1/controller/navcontroller.dart';
import 'package:latihan1/pages/calculatorpage.dart';
import 'package:latihan1/pages/footballpage.dart';
import 'package:latihan1/pages/profilepage.dart';
import 'package:latihan1/pages/tablepremierepage.dart';


class HomePage extends StatelessWidget {
  final NavController navController = Get.put(NavController());

  final List<Widget> pages = [
    CalculatorPage(hasil: '',),
    Tablepremierepage(),
    ProfilePage(),
    Container(),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      body: pages[navController.selectedIndex.value],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navController.selectedIndex.value,
        onTap: navController.changePage,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.calculate), label: 'Kalkulator'),
          BottomNavigationBarItem(icon: Icon(Icons.sports_soccer), label: 'Football'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),  
        ],
      ),
    ));
  }
}
