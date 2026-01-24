import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan1/pages/absensi_tambah.dart';
import 'package:latihan1/pages/absensi_list.dart';

class NavbarController extends GetxController {
  var selectedIndex = 0.obs;

  Widget getPage(int index) {
    switch (index) {
      case 0:
        return const TambahAbsensiPage();
      case 1:
        return const AbsensiListPage();
      default:
        return const TambahAbsensiPage();
    }
  }

  void changePage(int index) {
    selectedIndex.value = index;
  }
}