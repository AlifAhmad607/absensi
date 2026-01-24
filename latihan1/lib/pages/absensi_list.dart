import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan1/services/absensi_service.dart';
import 'package:latihan1/Routes/Approutes.dart';

class AbsensiListPage extends StatelessWidget {
  const AbsensiListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AbsensiService service = Get.find<AbsensiService>();

    return StreamBuilder(
      stream: service.ref.onValue,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (!snapshot.hasData || snapshot.data!.snapshot.value == null) {
          return const Center(child: Text("Belum ada data"));
        }

        final Map data = snapshot.data!.snapshot.value as Map;
        final entries = data.entries.toList().reversed;

        return ListView(
          padding: const EdgeInsets.all(8),
          children: entries.map<Widget>((e) {
            final key = e.key;
            final val = Map<String, dynamic>.from(e.value);

            return Card(
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: ListTile(
                title: Text(val["nama"] ?? "-",
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text(
                  "${val["kelas"] ?? '-'} • ${val["tanggal"] ?? '-'}",
                  style: const TextStyle(color: Colors.grey),
                ),
                trailing: PopupMenuButton<String>(
                  onSelected: (value) {
                    if (value == "edit") {
                      Get.toNamed(
                        Approutes.editabsen,
                        arguments: {"key": key, "data": val},
                      );
                    } else if (value == "delete") {
                      _confirmDelete(service, key);
                    }
                  },
                  itemBuilder: (context) => [
                    const PopupMenuItem(
                        value: "edit",
                        child: Row(
                          children: [
                            Icon(Icons.edit, size: 18, color: Colors.blue),
                            SizedBox(width: 8),
                            Text("Edit"),
                          ],
                        )),
                    const PopupMenuItem(
                        value: "delete",
                        child: Row(
                          children: [
                            Icon(Icons.delete, size: 18, color: Colors.red),
                            SizedBox(width: 8),
                            Text("Hapus"),
                          ],
                        )),
                  ],
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }

  void _confirmDelete(AbsensiService service, String key) {
    Get.defaultDialog(
      title: "Hapus Data",
      middleText: "Yakin ingin menghapus data ini?",
      textCancel: "Batal",
      textConfirm: "Hapus",
      confirmTextColor: Colors.white,
      buttonColor: Colors.red,
      onConfirm: () {
        service.hapusAbsensi(key);
        Get.back();
        Get.snackbar(
          "Berhasil",
          "Data berhasil dihapus",
          backgroundColor: Colors.red.shade100,
          colorText: Colors.black,
        );
      },
    );
  }
}
