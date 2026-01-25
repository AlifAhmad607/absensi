import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan1/services/absensi_service.dart';

class AbsensiController extends GetxController {
  final AbsensiService service;

  AbsensiController({required this.service});

  final namaC = TextEditingController();
  final kelasC = TextEditingController();
  var status = "Hadir".obs;

  void isiDariData(Map<String, dynamic> data) {
    namaC.text = data["nama"] ?? '';
    kelasC.text = data["kelas"] ?? '';
    status.value = data["status"] ?? 'Hadir';
  }

  Future<void> tambahAbsensi() async {
    if (namaC.text.isEmpty || kelasC.text.isEmpty) {
      Get.snackbar(
        "Peringatan",
        "Nama dan kelas tidak boleh kosong",
        backgroundColor: Colors.orange.shade100,
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    await service.tambahAbsensi(
      nama: namaC.text,
      kelas: kelasC.text,
      status: status.value,
    );

    namaC.clear();
    kelasC.clear();
    status.value = "Hadir";

    Get.snackbar(
      "Sukses",
      "Data berhasil ditambahkan",
      backgroundColor: Colors.green.shade100,
      colorText: Colors.black,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  Future<void> updateAbsensi(String key) async {
    if (namaC.text.isEmpty || kelasC.text.isEmpty) {
      Get.snackbar(
        "Peringatan",
        "Nama dan kelas tidak boleh kosong",
        backgroundColor: Colors.orange.shade100,
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    await service.updateAbsensi(
      key: key,
      nama: namaC.text,
      kelas: kelasC.text,
      status: status.value,
    );

    Get.back();
    Get.snackbar(
      "Sukses",
      "Data berhasil diperbarui",
      backgroundColor: Colors.green.shade100,
      colorText: Colors.black,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  @override
  void onClose() {
    namaC.dispose();
    kelasC.dispose();
    super.onClose();
  }
}