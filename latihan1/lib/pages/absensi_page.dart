import 'package:flutter/material.dart';
import 'package:latihan1/services/absensi_service.dart';
import 'package:latihan1/widget/absensi_list.dart';

class AbsensiPage extends StatelessWidget {
  final AbsensiService service;

  const AbsensiPage({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Daftar Absensi")),
      body: AbsensiList(service: service),
    );
  }
}
