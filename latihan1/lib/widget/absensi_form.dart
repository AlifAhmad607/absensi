import 'package:flutter/material.dart';
import '../services/absensi_service.dart';

class AbsensiForm extends StatefulWidget {
  final AbsensiService service;

  const AbsensiForm({super.key, required this.service});

  @override
  State<AbsensiForm> createState() => _AbsensiFormState();
}

class _AbsensiFormState extends State<AbsensiForm> {
  final namaC = TextEditingController();
  final kelasC = TextEditingController();
  String status = "Hadir";

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "Input Absensi",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: namaC,
              decoration: const InputDecoration(
                labelText: "Nama",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: kelasC,
              decoration: const InputDecoration(
                labelText: "Kelas",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              value: status,
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
              onChanged: (v) => setState(() => status = v!),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                widget.service.tambahAbsensi(
                  nama: namaC.text,
                  kelas: kelasC.text,
                  status: status,
                );
                namaC.clear();
                kelasC.clear();
              },
              child: const Text("Tambah"),
            ),
          ],
        ),
      ),
    );
  }
}
