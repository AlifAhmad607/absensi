import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan1/controller/navbar_controller.dart';
import 'package:latihan1/config/app_theme.dart';

class HomeAbsensiPage extends StatelessWidget {
  const HomeAbsensiPage({super.key});

  @override
  Widget build(BuildContext context) {
    final NavbarController c = Get.find<NavbarController>();

    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Text(
            c.selectedIndex.value == 0 ? "Tambah Absensi" : "Data Absensi",
          ),
          elevation: 2,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: AppTheme.primaryGradient,
            ),
          ),
        ),
        body: c.getPage(c.selectedIndex.value),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, -2),
              ),
            ],
          ),
          child: BottomNavigationBar(
            currentIndex: c.selectedIndex.value,
            onTap: c.changePage,
            selectedItemColor: AppTheme.primaryGreen,
            unselectedItemColor: AppTheme.textSecondary,
            selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.add_circle_outline),
                activeIcon: Icon(Icons.add_circle),
                label: "Tambah",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.list_alt_outlined),
                activeIcon: Icon(Icons.list_alt),
                label: "Data",
              ),
            ],
          ),
        ),
      ),
    );
  }
}