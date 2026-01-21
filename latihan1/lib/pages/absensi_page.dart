import 'package:flutter/material.dart';
import '../services/absensi_service.dart';
import '../widget/absensi_list.dart';
import 'absensi_edit.dart';

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
