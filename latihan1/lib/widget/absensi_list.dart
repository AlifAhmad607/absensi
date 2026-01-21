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
        if (!snapshot.hasData || snapshot.data!.snapshot.value == null) {
          return const Center(child: Text("Belum ada data"));
        }

        final Map data = snapshot.data!.snapshot.value as Map;

        return ListView(
          children: data.entries.map<Widget>((e) {
            final key = e.key;
            final val = Map<String, dynamic>.from(e.value);

            return Card(
              child: ListTile(
                title: Text(val["nama"]),
                subtitle: Text("${val["kelas"]} • ${val["tanggal"]}"),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
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
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () => service.hapusAbsensi(key),
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
}
