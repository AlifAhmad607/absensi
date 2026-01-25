import 'package:flutter/material.dart';
import 'package:latihan1/config/app_theme.dart';

class StatusBadge extends StatelessWidget {
  final String status;

  const StatusBadge({super.key, required this.status});

  Color get backgroundColor {
    switch (status.toLowerCase()) {
      case 'hadir':
        return AppTheme.accentGreen;
      case 'izin':
        return AppTheme.warningColor;
      case 'alpha':
        return AppTheme.errorColor;
      default:
        return AppTheme.textSecondary;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: backgroundColor.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: backgroundColor, width: 1.5),
      ),
      child: Text(
        status,
        style: TextStyle(
          color: backgroundColor,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}