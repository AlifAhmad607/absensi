import 'package:flutter/material.dart';
import '../services/absensi_service.dart';

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
  late TextEditingController namaC;
  late TextEditingController kelasC;
  late String status;

  @override
  void initState() {
    super.initState();
    namaC = TextEditingController(text: widget.data["nama"]);
    kelasC = TextEditingController(text: widget.data["kelas"]);
    status = widget.data["status"];
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
                widget.service.updateAbsensi(
                  key: widget.keyData,
                  nama: namaC.text,
                  kelas: kelasC.text,
                  status: status,
                );
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Data berhasil diperbarui")),
                );
              },
              child: const Text("Update"),
            ),
          ],
        ),
      ),
    );
  }
}
