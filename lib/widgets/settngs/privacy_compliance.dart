import 'package:carpool_admin/utils/theme/colors.dart';
import 'package:carpool_admin/utils/theme/fonts.dart';
import 'package:flutter/material.dart';

class PrivacyCompliance extends StatefulWidget {
  const PrivacyCompliance({super.key});

  @override
  State<PrivacyCompliance> createState() => _PrivacyComplianceState();
}

class _PrivacyComplianceState extends State<PrivacyCompliance> {
  bool _gdprCompliant = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Privacy & Compliance',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: AppColors.pageHeaderTitle,
                fontFamily: AppFonts.primary,
              ),
            ),
            const SizedBox(height: 12),
            buildSettingsToggle(
              title: 'GDPR Compliance Mode',
              subtitle: 'GDPR Compliance Mode',
              value: _gdprCompliant,
              onChanged: (value) {
                setState(() {
                  _gdprCompliant = value;
                });
              },
            ),

            const SizedBox(height: 8),
            const Text(
              'Data Detection Requests',
              style: TextStyle(
                fontSize: 12,
                color: Color(0xFF262626),
                fontFamily: AppFonts.primary,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Text(
              'Handle user data detection request within 30 days',
              style: TextStyle(
                fontSize: 10,
                color: Color(0xFF9A9A9A),
                fontFamily: AppFonts.primary,
              ),
            ),
            const SizedBox(height: 8),
            customOutlineButton(label: 'View Pending Requests (3)'),
            const SizedBox(height: 16),
            const Text(
              'Privacy Policy',
              style: TextStyle(
                fontSize: 12,
                color: Color(0xFF262626),
                fontFamily: AppFonts.primary,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            customOutlineButton(label: 'Edit Privacy Policy'),
            const SizedBox(height: 16),
            const Text(
              'Terms of Service',
              style: TextStyle(
                fontSize: 12,
                color: Color(0xFF262626),
                fontFamily: AppFonts.primary,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            customOutlineButton(label: 'Edit Terms of Service'),
          ],
        ),
      ),
    );
  }
}

Widget customOutlineButton({required String label, VoidCallback? onTap}) {
  return OutlinedButton(
    onPressed: onTap,
    style: OutlinedButton.styleFrom(
      side: const BorderSide(color: Color(0xFFA6A6A6), width: 1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      minimumSize: Size.zero,
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
    ),
    child: Text(
      label,
      style: TextStyle(
        color: Colors.black,
        fontSize: 12,
        fontWeight: FontWeight.w600,
        fontFamily: AppFonts.primary, // Using your custom font
      ),
    ),
  );
}

Widget buildSettingsToggle({
  required String title,
  required String subtitle,
  required bool value,
  required ValueChanged<bool> onChanged,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFF262626),
              fontFamily: AppFonts.primary,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 10,
              color: Color(0xFF9A9A9A),
              fontFamily: AppFonts.primary,
            ),
          ),
        ],
      ),
      Transform.scale(
        scale: 0.7,
        // Aligns the scaled switch to the right to avoid weird gaps
        alignment: Alignment.centerRight,
        child: Switch.adaptive(
          value: value,
          onChanged: onChanged,
          activeColor: AppColors.primary,
        ),
      ),
    ],
  );
}
