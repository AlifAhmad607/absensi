import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan1/services/absensi_service.dart';
import 'package:latihan1/Routes/Approutes.dart';
import 'package:latihan1/config/app_theme.dart';
import 'package:latihan1/widget/status_badge.dart';
import 'package:latihan1/widget/empty_state.dart';

class AbsensiListPage extends StatelessWidget {
  const AbsensiListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AbsensiService service = Get.find<AbsensiService>();

    return Container(
      decoration: const BoxDecoration(
        gradient: AppTheme.lightGradient,
      ),
      child: StreamBuilder(
        stream: service.ref.onValue,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppTheme.primaryGreen,
              ),
            );
          }
          
          if (!snapshot.hasData || snapshot.data!.snapshot.value == null) {
            return const EmptyState(
              message: "Belum ada data absensi\nTambahkan data di tab Tambah",
              icon: Icons.event_busy_rounded,
            );
          }

          final Map data = snapshot.data!.snapshot.value as Map;
          final entries = data.entries.toList().reversed;

          return ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            itemCount: entries.length,
            itemBuilder: (context, index) {
              final e = entries.elementAt(index);
              final key = e.key;
              final val = Map<String, dynamic>.from(e.value);

              return Card(
                margin: const EdgeInsets.only(bottom: 12),
                elevation: 3,
                child: InkWell(
                  borderRadius: BorderRadius.circular(16),
                  onTap: () {
                    Get.toNamed(
                      Approutes.editabsen,
                      arguments: {"key": key, "data": val},
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            gradient: AppTheme.primaryGradient,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                            child: Text(
                              val["nama"]?.substring(0, 1).toUpperCase() ?? "?",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const Padding(padding: EdgeInsets.only(right: 16)),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                val["nama"] ?? "-",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: AppTheme.textPrimary,
                                ),
                              ),
                              const Padding(padding: EdgeInsets.only(top: 4)),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.class_outlined,
                                    size: 14,
                                    color: AppTheme.textSecondary,
                                  ),
                                  const Padding(padding: EdgeInsets.only(right: 4)),
                                  Text(
                                    val["kelas"] ?? '-',
                                    style: const TextStyle(
                                      fontSize: 13,
                                      color: AppTheme.textSecondary,
                                    ),
                                  ),
                                  const Padding(padding: EdgeInsets.symmetric(horizontal: 6)),
                                  const Icon(
                                    Icons.calendar_today,
                                    size: 14,
                                    color: AppTheme.textSecondary,
                                  ),
                                  const Padding(padding: EdgeInsets.only(right: 4)),
                                  Text(
                                    val["tanggal"] ?? '-',
                                    style: const TextStyle(
                                      fontSize: 13,
                                      color: AppTheme.textSecondary,
                                    ),
                                  ),
                                ],
                              ),
                              const Padding(padding: EdgeInsets.only(top: 8)),
                              StatusBadge(status: val["status"] ?? "Hadir"),
                            ],
                          ),
                        ),
                        PopupMenuButton<String>(
                          icon: const Icon(
                            Icons.more_vert,
                            color: AppTheme.textSecondary,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
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
                                  Icon(Icons.edit_rounded, size: 20, color: AppTheme.primaryGreen),
                                  Padding(padding: EdgeInsets.only(right: 12)),
                                  Text("Edit Data"),
                                ],
                              ),
                            ),
                            const PopupMenuItem(
                              value: "delete",
                              child: Row(
                                children: [
                                  Icon(Icons.delete_rounded, size: 20, color: AppTheme.errorColor),
                                  Padding(padding: EdgeInsets.only(right: 12)),
                                  Text("Hapus Data"),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  void _confirmDelete(AbsensiService service, String key) {
    Get.defaultDialog(
      title: "Hapus Data",
      titleStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        color: AppTheme.errorColor,
      ),
      middleText: "Yakin ingin menghapus data ini?\nData yang dihapus tidak dapat dikembalikan.",
      middleTextStyle: const TextStyle(fontSize: 14),
      radius: 12,
      textCancel: "Batal",
      textConfirm: "Hapus",
      cancelTextColor: AppTheme.textSecondary,
      confirmTextColor: Colors.white,
      buttonColor: AppTheme.errorColor,
      onConfirm: () {
        service.hapusAbsensi(key);
        Get.back();
        Get.snackbar(
          "Berhasil",
          "Data berhasil dihapus",
          backgroundColor: AppTheme.errorColor.withOpacity(0.1),
          colorText: AppTheme.errorColor,
          icon: const Icon(Icons.check_circle, color: AppTheme.errorColor),
          snackPosition: SnackPosition.BOTTOM,
          margin: const EdgeInsets.all(16),
          borderRadius: 12,
        );
      },
    );
  }
}