import 'package:flutter/material.dart';

class PrivacyAndCompliance extends StatefulWidget {
  const PrivacyAndCompliance({super.key});

  @override
  State<PrivacyAndCompliance> createState() => _PrivacyAndComplianceState();
}

class _PrivacyAndComplianceState extends State<PrivacyAndCompliance> {
  bool _gdprEnabled = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.all(16.0),
      children: [
        // GDPR Compliance Section
        Switch(
          value: _gdprEnabled,
          onChanged: (value) {
            setState(() {
              _gdprEnabled = value;
            });
          },
        ),
        const SizedBox(height: 16),

        // Data Detection Requests Section
        _buildSectionHeader(
          "Data Detection Requests",
          "Handle user data detection request within 30 days",
        ),
        const SizedBox(height: 8),
        _buildActionButton("View Pending Requests (3)", () {}),

        const SizedBox(height: 24),

        // Privacy Policy Section
        _buildSectionHeader(
          "Privacy Policy",
          null, // No subtitle for this one in the image
        ),
        const SizedBox(height: 8),
        _buildActionButton("Edit Privacy Policy", () {}),

        const SizedBox(height: 24),

        // Terms of Service Section
        _buildSectionHeader("Terms of Services", null),
        const SizedBox(height: 8),
        _buildActionButton("Edit Terms of Service", () {}),
      ],
    );
  }

  // Helper to build the text labels
  Widget _buildSectionHeader(String title, String? subtitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
        ),
        if (subtitle != null)
          Text(
            subtitle,
            style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
          ),
      ],
    );
  }

  // Helper to build the specific outlined buttons
  Widget _buildActionButton(String label, VoidCallback onPressed) {
    return UnconstrainedBox(
      alignment: Alignment.centerLeft,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          foregroundColor: Colors.black,
          side: BorderSide(color: Colors.grey.shade400),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
        child: Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
      ),
    );
  }
}
