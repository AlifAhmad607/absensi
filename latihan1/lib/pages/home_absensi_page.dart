import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan1/controller/navbar_controller.dart';

class HomeAbsensiPage extends StatelessWidget {
  const HomeAbsensiPage({super.key});

  @override
  Widget build(BuildContext context) {
    final NavbarController c = Get.find<NavbarController>();

    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Text(
            c.selectedIndex.value == 0
                ? "Tambah Absensi"
                : "Data Absensi",
          ),
          centerTitle: true,
        ),
        body: c.getPage(c.selectedIndex.value),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: c.selectedIndex.value,
          onTap: c.changePage,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: "Tambah",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: "Lihat",
            ),
          ],
        ),
      ),
    );
  }
}