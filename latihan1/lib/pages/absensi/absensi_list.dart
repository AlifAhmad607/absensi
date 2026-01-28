import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan1/responsive/responsive.dart';
import 'package:latihan1/controller/absensi_controller.dart';
import 'package:latihan1/Routes/Approutes.dart';
import 'package:latihan1/config/app_theme.dart';
import 'package:latihan1/widget/status_badge.dart';
import 'package:latihan1/widget/empty_state.dart';

class AbsensiListPage extends StatelessWidget {
  const AbsensiListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AbsensiController>();

    return Container(
      decoration: const BoxDecoration(
        gradient: AppTheme.lightGradient,
      ),
      child: Obx(() {
        if (controller.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(
              color: AppTheme.primaryGreen,
            ),
          );
        }

        if (controller.absensiList.isEmpty) {
          return const EmptyState(
            message: "Belum ada data absensi\nTambahkan data di tab Tambah",
            icon: Icons.event_busy_rounded,
          );
        }

        return ListView.builder(
          padding: EdgeInsets.symmetric(
            vertical: 12,
            horizontal: Responsive.isMobile(context) ? 16 : 32,
          ),
          itemCount: controller.absensiList.length,
          itemBuilder: (context, index) {
            final item = controller.absensiList[index];
            final key = item['key'] as String;
            final val = Map<String, dynamic>.from(item);

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
                  padding: EdgeInsets.all(
                    Responsive.isMobile(context) ? 16 : 20,
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: Responsive.isMobile(context) ? 48 : 60,
                        height: Responsive.isMobile(context) ? 48 : 60,
                        decoration: BoxDecoration(
                          gradient: AppTheme.primaryGradient,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Text(
                            val["nama"]?.substring(0, 1).toUpperCase() ?? "?",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize:
                                  Responsive.isMobile(context) ? 20 : 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(width: 16),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              val["nama"] ?? "-",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize:
                                    Responsive.isMobile(context) ? 16 : 18,
                                color: AppTheme.textPrimary,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                const Icon(
                                  Icons.class_outlined,
                                  size: 14,
                                  color: AppTheme.textSecondary,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  val["kelas"] ?? '-',
                                  style: TextStyle(
                                    fontSize: Responsive.isMobile(context)
                                        ? 12
                                        : 13,
                                    color: AppTheme.textSecondary,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                const Icon(
                                  Icons.calendar_today,
                                  size: 14,
                                  color: AppTheme.textSecondary,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  val["tanggal"] ?? '-',
                                  style: TextStyle(
                                    fontSize: Responsive.isMobile(context)
                                        ? 12
                                        : 13,
                                    color: AppTheme.textSecondary,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
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
                            _confirmDelete(controller, key);
                          }
                        },
                        itemBuilder: (context) => const [
                          PopupMenuItem(
                            value: "edit",
                            child: Row(
                              children: [
                                Icon(Icons.edit_rounded,
                                    size: 20,
                                    color: AppTheme.primaryGreen),
                                SizedBox(width: 12),
                                Text("Edit Data"),
                              ],
                            ),
                          ),
                          PopupMenuItem(
                            value: "delete",
                            child: Row(
                              children: [
                                Icon(Icons.delete_rounded,
                                    size: 20,
                                    color: AppTheme.errorColor),
                                SizedBox(width: 12),
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
      }),
    );
  }

  void _confirmDelete(AbsensiController controller, String key) {
    Get.defaultDialog(
      title: "Hapus Data",
      titleStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        color: AppTheme.errorColor,
      ),
      middleText:
          "Yakin ingin menghapus data ini?\nData yang dihapus tidak dapat dikembalikan.",
      radius: 12,
      textCancel: "Batal",
      textConfirm: "Hapus",
      cancelTextColor: AppTheme.textSecondary,
      confirmTextColor: Colors.white,
      buttonColor: AppTheme.errorColor,
      onConfirm: () async {
        await controller.hapusAbsensi(key);
        Get.back();
        Get.snackbar(
          "Berhasil",
          "Data berhasil dihapus",
          backgroundColor: AppTheme.errorColor.withOpacity(0.1),
          colorText: AppTheme.errorColor,
          snackPosition: SnackPosition.BOTTOM,
          margin: const EdgeInsets.all(16),
          borderRadius: 12,
        );
      },
    );
  }
}