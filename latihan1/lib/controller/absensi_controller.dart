import 'package:flutter/material.dart';
import '../services/absensi_service.dart';

class AbsensiController {
  final AbsensiService service;

  AbsensiController({required this.service});

  final TextEditingController namaC = TextEditingController();
  final TextEditingController kelasC = TextEditingController();
  String status = "Hadir";

  void isiDariData(Map<String, dynamic> data) {
    namaC.text = data["nama"];
    kelasC.text = data["kelas"];
    status = data["status"];
  }

  Future<void> tambahAbsensi(BuildContext context) async {
    if (namaC.text.isEmpty || kelasC.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Nama dan kelas tidak boleh kosong")),
      );
      return;
    }

    await service.tambahAbsensi(
      nama: namaC.text,
      kelas: kelasC.text,
      status: status,
    );

    namaC.clear();
    kelasC.clear();
    status = "Hadir";

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Data berhasil ditambahkan")),
    );
  }

  Future<void> updateAbsensi({
    required BuildContext context,
    required String key,
  }) async {
    if (namaC.text.isEmpty || kelasC.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Nama dan kelas tidak boleh kosong")),
      );
      return;
    }

    await service.updateAbsensi(
      key: key,
      nama: namaC.text,
      kelas: kelasC.text,
      status: status,
    );

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Data berhasil diperbarui")),
    );
  }

  void dispose() {
    namaC.dispose();
    kelasC.dispose();
  }
}
