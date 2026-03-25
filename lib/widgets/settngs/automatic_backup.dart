import 'package:carpool_admin/utils/theme/colors.dart';
import 'package:carpool_admin/utils/theme/fonts.dart';
import 'package:carpool_admin/widgets/settngs/custom_textfield.dart';
import 'package:flutter/material.dart';

class AutomaticBackup extends StatelessWidget {
  const AutomaticBackup({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
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

        CustomTextfield(labelText: 'Backup Frequency', hintText: 'Daily'),

        const SizedBox(height: 16),

        // Retention Period Section
        CustomTextfield(labelText: 'Retention Period', hintText: '1 year'),
      ],
    );
  }
}
