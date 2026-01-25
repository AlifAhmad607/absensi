import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan1/controller/absensi_controller.dart';
import 'package:latihan1/config/app_theme.dart';
import 'package:latihan1/widget/custom_text_field.dart';
import 'package:latihan1/widget/custom_dropdown.dart';
import 'package:latihan1/widget/custom_button.dart';

class EditAbsensiPage extends StatelessWidget {
  const EditAbsensiPage({super.key});

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments as Map<String, dynamic>;
    final keyData = args['key'];
    final data = Map<String, dynamic>.from(args['data']);

    final controller = Get.find<AbsensiController>();
    controller.isiDariData(data);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Absensi"),
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: AppTheme.primaryGradient,
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppTheme.lightGradient,
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Card(
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
                            Icons.edit_rounded,
                            color: AppTheme.primaryGreen,
                            size: 28,
                          ),
                        ),
                        const Padding(padding: EdgeInsets.only(right: 16)),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Edit Data Absensi",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: AppTheme.textPrimary,
                              ),
                            ),
                            Text(
                              "Perbarui informasi kehadiran",
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
                      prefixIcon: Icons.person_outline,
                    ),
                    const Padding(padding: EdgeInsets.only(top: 16)),
                    CustomTextField(
                      controller: controller.kelasC,
                      label: "Kelas",
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
                      text: "Update Data",
                      icon: Icons.update_rounded,
                      onPressed: () => controller.updateAbsensi(keyData),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}