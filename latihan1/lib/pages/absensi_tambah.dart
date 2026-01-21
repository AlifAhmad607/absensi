import 'package:flutter/material.dart';
import '../services/absensi_service.dart';

class TambahAbsensiPage extends StatefulWidget {
  final AbsensiService service;
  const TambahAbsensiPage({super.key, required this.service});

  @override
  State<TambahAbsensiPage> createState() => _TambahAbsensiPageState();
}

class _TambahAbsensiPageState extends State<TambahAbsensiPage> {
  final namaC = TextEditingController();
  final kelasC = TextEditingController();
  String status = "Hadir";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tambah Absensi")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
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
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                widget.service.tambahAbsensi(
                  nama: namaC.text,
                  kelas: kelasC.text,
                  status: status,
                );
                namaC.clear();
                kelasC.clear();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Data berhasil ditambahkan")),
                );
              },
              child: const Text("Simpan"),
            ),
          ],
        ),
      ),
    );
  }
}
