import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan1/controller/absensi_controller.dart';

class EditAbsensiPage extends StatelessWidget {
  const EditAbsensiPage({super.key});

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments as Map<String, dynamic>;
    final keyData = args['key'];
    final data = Map<String, dynamic>.from(args['data']);

    final controller = Get.find<AbsensiController>();
    controller.isiDariData(data);

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
            Obx(() => DropdownButtonFormField<String>(
                  value: controller.status.value,
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
                  onChanged: (v) => controller.status.value = v!,
                )),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => controller.updateAbsensi(keyData),
              child: const Text("Update"),
            ),
          ],
        ),
      ),
    );
  }
}
