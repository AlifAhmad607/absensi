import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan1/controller/absensi_controller.dart';

class TambahAbsensiPage extends StatelessWidget {
  const TambahAbsensiPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AbsensiController>();

    return SingleChildScrollView(
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
            onPressed: controller.tambahAbsensi,
            child: const Text("Simpan"),
          ),
        ],
      ),
    );
  }
}
