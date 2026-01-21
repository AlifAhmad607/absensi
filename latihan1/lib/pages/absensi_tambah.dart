import 'package:flutter/material.dart';
import 'package:latihan1/controller/absensi_controller.dart';
import 'package:latihan1/services/absensi_service.dart';

class TambahAbsensiPage extends StatefulWidget {
  final AbsensiService service;

  const TambahAbsensiPage({super.key, required this.service});

  @override
  State<TambahAbsensiPage> createState() => _TambahAbsensiPageState();
}

class _TambahAbsensiPageState extends State<TambahAbsensiPage> {
  late final AbsensiController controller;

  @override
  void initState() {
    super.initState();
    controller = AbsensiController(service: widget.service);

  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tambah Absensi")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: controller.namaC,
              decoration: const InputDecoration(
                labelText: "Nama",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: controller.kelasC,
              decoration: const InputDecoration(
                labelText: "Kelas",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              value: controller.status,
              decoration: const InputDecoration(
                labelText: "Status",
                border: OutlineInputBorder(),
              ),
              items: ["Hadir", "Izin", "Alpha"]
                  .map((e) => DropdownMenuItem(
                        value: e,
                        child: Text(e),
                      ))
                  .toList(),
              onChanged: (v) => setState(() => controller.status = v!),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => controller.tambahAbsensi(context),
              child: const Text("Simpan"),
            ),
          ],
        ),
      ),
    );
  }
}
