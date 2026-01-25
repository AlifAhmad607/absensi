import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan1/controller/absensi_controller.dart';
import 'package:latihan1/config/app_theme.dart';
import 'package:latihan1/widget/custom_text_field.dart';
import 'package:latihan1/widget/custom_dropdown.dart';
import 'package:latihan1/widget/custom_button.dart';

class TambahAbsensiPage extends StatelessWidget {
  const TambahAbsensiPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AbsensiController>();

    return Container(
      decoration: const BoxDecoration(
        gradient: AppTheme.lightGradient,
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: AppTheme.primaryGreen.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Icon(
                              Icons.person_add_rounded,
                              color: AppTheme.primaryGreen,
                              size: 28,
                            ),
                          ),
                          const Padding(padding: EdgeInsets.only(right: 16)),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Form Absensi",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: AppTheme.textPrimary,
                                ),
                              ),
                              Text(
                                "Isi data kehadiran siswa",
                                style: TextStyle(
                                  fontSize: 13,
                                  color: AppTheme.textSecondary,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Padding(padding: EdgeInsets.only(top: 24)),
                      CustomTextField(
                        controller: controller.namaC,
                        label: "Nama Lengkap",
                        hint: "Masukkan nama siswa",
                        prefixIcon: Icons.person_outline,
                      ),
                      const Padding(padding: EdgeInsets.only(top: 16)),
                      CustomTextField(
                        controller: controller.kelasC,
                        label: "Kelas",
                        hint: "Contoh: XII IPA 1",
                        prefixIcon: Icons.class_outlined,
                      ),
                      const Padding(padding: EdgeInsets.only(top: 16)),
                      CustomDropdown(
                        label: "Status Kehadiran",
                        value: controller.status,
                        items: const ["Hadir", "Izin", "Alpha"],
                        prefixIcon: Icons.checklist_rounded,
                      ),
                      const Padding(padding: EdgeInsets.only(top: 24)),
                      CustomButton(
                        text: "Simpan Data",
                        icon: Icons.save_rounded,
                        onPressed: controller.tambahAbsensi,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}