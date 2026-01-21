import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:latihan1/pages/homepage.dart';

class Mainmenucontroller extends GetxController{
  
  var selectedIndex = 0.obs;

  final List<Widget> pages = [
    HomePage()
  ];

  void changePage(int index){
    selectedIndex.value = index;
  }
} 