import 'package:flutter/material.dart';
import 'package:latihan1/pages/absensi_edit.dart';
import '../services/absensi_service.dart';

class AbsensiList extends StatelessWidget {
  final AbsensiService service;

  const AbsensiList({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
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
          children: entries.map<Widget>((e) {
            final key = e.key;
            final val = Map<String, dynamic>.from(e.value);

            return Card(
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                title: Text(
                  val["nama"],
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  "${val["kelas"]} • ${val["tanggal"]}",
                  style: const TextStyle(fontSize: 13, color: Colors.grey),
                ),
                trailing: PopupMenuButton<String>(
                  onSelected: (value) {
                    if (value == "edit") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => EditAbsensiPage(
                            service: service,
                            keyData: key,
                            data: val,
                          ),
                        ),
                      );
                    } else if (value == "delete") {
                      _confirmDelete(context, key);
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
                      ),
                    ),
                    const PopupMenuItem(
                      value: "delete",
                      child: Row(
                        children: [
                          Icon(Icons.delete, size: 18, color: Colors.red),
                          SizedBox(width: 8),
                          Text("Hapus"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }

  // 🧱 Fungsi konfirmasi hapus
  void _confirmDelete(BuildContext context, String key) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Hapus Data"),
        content: const Text("Yakin ingin menghapus data ini?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text("Batal"),
          ),
          ElevatedButton.icon(
            onPressed: () {
              service.hapusAbsensi(key);
              Navigator.pop(ctx);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Data berhasil dihapus")),
              );
            },
            icon: const Icon(Icons.delete),
            label: const Text("Hapus"),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
          ),
        ],
      ),
    );
  }
}
