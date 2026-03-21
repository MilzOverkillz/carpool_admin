import 'package:carpool_admin/utils/theme/colors.dart';
import 'package:carpool_admin/utils/theme/fonts.dart';
import 'package:flutter/material.dart';

class AutomaticBackup extends StatelessWidget {
  const AutomaticBackup({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(24.0),
        children: [
          const Text(
            'Data Management',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: AppColors.pageHeaderTitle,
              fontFamily: AppFonts.primary,
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Automatic Backup',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: AppColors.pageHeaderTitle,
              fontFamily: AppFonts.primary,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'Configure global platform settings',
            style: TextStyle(
              fontSize: 12,
              color: AppColors.pageHeaderSubtitle,
              fontFamily: AppFonts.dmSans,
            ),
          ),
          const SizedBox(height: 20),

          // Backup Frequency Section
          const Text(
            'Backup Frequency',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppColors.pageHeaderTitle,
              fontFamily: AppFonts.primary,
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            decoration: InputDecoration(
              hintText: 'Daily',
              hintStyle: const TextStyle(color: Colors.grey, fontSize: 12),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: AppColors.textTertiary),
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Retention Period Section
          const Text(
            'Retention Period',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppColors.authHeading,
              fontFamily: AppFonts.primary,
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            decoration: InputDecoration(
              hintText: '1 year',
              hintStyle: const TextStyle(color: Colors.grey, fontSize: 12),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: AppColors.textTertiary),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
