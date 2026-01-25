import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan1/config/app_theme.dart';

class CustomDropdown extends StatelessWidget {
  final String label;
  final RxString value;
  final List<String> items;
  final IconData? prefixIcon;

  const CustomDropdown({
    super.key,
    required this.label,
    required this.value,
    required this.items,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: AppTheme.textPrimary,
          ),
        ),
        const Padding(padding: EdgeInsets.only(top: 8)),
        Obx(
          () => DropdownButtonFormField<String>(
            value: value.value,
            decoration: InputDecoration(
              prefixIcon: prefixIcon != null
                  ? Icon(prefixIcon, color: AppTheme.lightGreen)
                  : null,
            ),
            items: items
                .map((item) => DropdownMenuItem(
                      value: item,
                      child: Text(item),
                    ))
                .toList(),
            onChanged: (v) => value.value = v!,
          ),
        ),
      ],
    );
  }
}