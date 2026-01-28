import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan1/controller/absensi_controller.dart';
import 'package:latihan1/config/app_theme.dart';
import 'package:latihan1/responsive/responsive.dart';
import 'package:latihan1/widget/custom_text_field.dart';
import 'package:latihan1/widget/custom_dropdown.dart';
import 'package:latihan1/widget/custom_button.dart';

class EditAbsensiPage extends StatelessWidget {
  const EditAbsensiPage({super.key});

  @override
  Widget build(BuildContext context) {
    
    return GetBuilder<AbsensiController>(
      initState: (_) {
        Get.find<AbsensiController>().initEditPage();
      },
      builder: (controller) {
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
                padding: EdgeInsets.all(
                  Responsive.isMobile(context) ? 16 : 32,
                ),
                child: Center(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: Responsive.isDesktop(context) ? 600 : double.infinity,
                    ),
                    child: Card(
                      elevation: 4,
                      child: Padding(
                        padding: EdgeInsets.all(
                          Responsive.isMobile(context) ? 16 : 24,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(
                                    Responsive.isMobile(context) ? 10 : 12,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppTheme.primaryGreen.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Icon(
                                    Icons.edit_rounded,
                                    color: AppTheme.primaryGreen,
                                    size: Responsive.isMobile(context) ? 24 : 28,
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Edit Data Absensi",
                                      style: TextStyle(
                                        fontSize:
                                            Responsive.isMobile(context) ? 18 : 20,
                                        fontWeight: FontWeight.bold,
                                        color: AppTheme.textPrimary,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      "Perbarui informasi kehadiran",
                                      style: TextStyle(
                                        fontSize:
                                            Responsive.isMobile(context) ? 12 : 13,
                                        color: AppTheme.textSecondary,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),

                            const SizedBox(height: 24),

                            CustomTextField(
                              controller: controller.namaC,
                              label: "Nama Lengkap",
                              prefixIcon: Icons.person_outline,
                            ),
                            const SizedBox(height: 16),

                            CustomTextField(
                              controller: controller.kelasC,
                              label: "Kelas",
                              prefixIcon: Icons.class_outlined,
                            ),
                            const SizedBox(height: 16),

                            CustomDropdown(
                              label: "Status Kehadiran",
                              value: controller.status,
                              items: const ["Hadir", "Izin", "Alpha"],
                              prefixIcon: Icons.checklist_rounded,
                            ),

                            const SizedBox(height: 24),

                            CustomButton(
                              text: "Update Data",
                              icon: Icons.update_rounded,
                              onPressed: controller.updateAbsensi,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}