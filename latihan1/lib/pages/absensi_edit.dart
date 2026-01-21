import 'package:flutter/material.dart';
import 'package:latihan1/controller/absensi_controller.dart';
import 'package:latihan1/services/absensi_service.dart';

class EditAbsensiPage extends StatefulWidget {
  final AbsensiService service;
  final String keyData;
  final Map<String, dynamic> data;

  const EditAbsensiPage({
    super.key,
    required this.service,
    required this.keyData,
    required this.data,
  });

  @override
  State<EditAbsensiPage> createState() => _EditAbsensiPageState();
}

class _EditAbsensiPageState extends State<EditAbsensiPage> {
  late final AbsensiController controller;

  @override
  void initState() {
    super.initState();
    // 🔧 Buat controller dengan service dari widget
    controller = AbsensiController(service: widget.service);
    controller.isiDariData(widget.data);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit Absensi")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
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
              onPressed: () => controller.updateAbsensi(
                context: context,
                key: widget.keyData,
              ),
              child: const Text("Update"),
            ),
          ],
        ),
      ),
    );
  }
}
