import 'package:flutter/material.dart';
import 'package:latihan1/services/absensi_service.dart';
import 'package:latihan1/widget/absensi_form.dart';
import 'package:latihan1/widget/absensi_list.dart';

class AbsensiPage extends StatelessWidget {
  const AbsensiPage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isTablet = width >= 600;

    final service = AbsensiService();

    return Scaffold(
      appBar: AppBar(title: const Text("Absensi Siswa")),

      // 🔥 TOMBOL TEST FIREBASE
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.cloud_upload),
        onPressed: () {
          service.tambahAbsensi(
            nama: "TEST SISWA",
            kelas: "TEST KELAS",
            status: "Hadir",
          );
        },
      ),

      body: Padding(
        padding: EdgeInsets.all(isTablet ? 16 : 8),
        child: isTablet
            ? Row(
                children: [
                  Expanded(flex: 2, child: AbsensiForm(service: service)),
                  const SizedBox(width: 16),
                  Expanded(flex: 3, child: AbsensiList(service: service)),
                ],
              )
            : Column(
                children: [
                  AbsensiForm(service: service),
                  const Divider(),
                  Expanded(child: AbsensiList(service: service)),
                ],
              ),
      ),
    );
  }
}
