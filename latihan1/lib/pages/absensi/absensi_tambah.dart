import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan1/controller/absensi_controller.dart';
import 'package:latihan1/config/app_theme.dart';
import 'package:latihan1/responsive/responsive.dart';
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
          padding: EdgeInsets.all(
            Responsive.isMobile(context) ? 16 : 32,
          ),
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth:
                    Responsive.isDesktop(context) ? 600 : double.infinity,
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
                              Icons.person_add_rounded,
                              color: AppTheme.primaryGreen,
                              size: Responsive.isMobile(context) ? 24 : 28,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Form Absensi",
                                style: TextStyle(
                                  fontSize:
                                      Responsive.isMobile(context) ? 18 : 20,
                                  fontWeight: FontWeight.bold,
                                  color: AppTheme.textPrimary,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                "Isi data kehadiran siswa",
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
                        hint: "Masukkan nama siswa",
                        prefixIcon: Icons.person_outline,
                      ),
                      const SizedBox(height: 16),

                      CustomTextField(
                        controller: controller.kelasC,
                        label: "Kelas",
                        hint: "Contoh: XII IPA 1",
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
                        text: "Simpan Data",
                        icon: Icons.save_rounded,
                        onPressed: controller.tambahAbsensi,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}