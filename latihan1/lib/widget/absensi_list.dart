import 'package:flutter/material.dart';
import '../services/absensi_service.dart';

class AbsensiList extends StatelessWidget {
  final AbsensiService service;

  const AbsensiList({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: service.ref.onValue,
      builder: (context, snapshot) {
        if (!snapshot.hasData ||
            snapshot.data!.snapshot.value == null) {
          return const Center(child: Text("Belum ada data"));
        }

        final Map data = snapshot.data!.snapshot.value as Map;

        return ListView(
          children: data.entries.map<Widget>((e) {
            final key = e.key;
            final val = e.value;

            return Card(
              child: ListTile(
                title: Text(val["nama"]),
                subtitle: Text("${val["kelas"]} • ${val["tanggal"]}"),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    DropdownButton<String>(
                      value: val["status"],
                      items: ["Hadir", "Izin", "Alpha"]
                          .map((s) => DropdownMenuItem(
                                value: s,
                                child: Text(s),
                              ))
                          .toList(),
                      onChanged: (s) =>
                          service.updateStatus(key, s!),
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () =>
                          service.hapusAbsensi(key),
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
