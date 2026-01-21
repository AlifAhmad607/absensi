import 'package:flutter/material.dart';
import 'package:latihan1/pages/absensi_tambah.dart';
import 'package:latihan1/services/absensi_service.dart';
import 'package:latihan1/widget/absensi_list.dart';

class AbsensiPage extends StatelessWidget {
  const AbsensiPage({super.key});

  @override
  Widget build(BuildContext context) {
    final service = AbsensiService();

    return Scaffold(
      appBar: AppBar(title: const Text("Absensi Siswa")),
      body: AbsensiList(service: service),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => TambahAbsensiPage(service: service),
            ),
          );
        },
      ),
    );
  }
}
