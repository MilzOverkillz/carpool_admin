import 'package:carpool_admin/utils/theme/colors.dart';
import 'package:carpool_admin/utils/theme/fonts.dart';
import 'package:carpool_admin/widgets/settngs/privacy_compliance.dart';
import 'package:flutter/material.dart';

class NotificationTemp extends StatefulWidget {
  const NotificationTemp({super.key});

  @override
  State<NotificationTemp> createState() => _NotificationTempState();
}

class _NotificationTempState extends State<NotificationTemp> {
  bool _gdprCompliant1 = true;
  bool _gdprCompliant2 = true;
  bool _gdprCompliant3 = true;
  bool _gdprCompliant4 = true;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Notification Channels',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: AppColors.pageHeaderTitle,
                  fontFamily: AppFonts.primary,
                ),
              ),
              const SizedBox(height: 12),
              buildSettingsToggle(
                title: 'Email Notifications',
                subtitle: 'Send notifications via Email',
                value: _gdprCompliant1,
                onChanged: (value) {
                  setState(() {
                    _gdprCompliant1 = value;
                  });
                },
              ),
              buildSettingsToggle(
                title: 'SMS Notifications',
                subtitle: 'Send notifications via SMS',
                value: _gdprCompliant2,
                onChanged: (value) {
                  setState(() {
                    _gdprCompliant2 = value;
                  });
                },
              ),
              buildSettingsToggle(
                title: 'Push Notifications',
                subtitle: 'Send push notifications to mobile apps',
                value: _gdprCompliant3,
                onChanged: (value) {
                  setState(() {
                    _gdprCompliant3 = value;
                  });
                },
              ),
              buildSettingsToggle(
                title: 'In-App Notifications',
                subtitle: 'Show notifications with the app',
                value: _gdprCompliant4,
                onChanged: (value) {
                  setState(() {
                    _gdprCompliant4 = value;
                  });
                },
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'System Notifications',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: AppColors.pageHeaderTitle,
                  fontFamily: AppFonts.primary,
                ),
              ),
              const SizedBox(height: 12),
              ToggleStatusItem(label: 'Ride Created'),
              ToggleStatusItem(label: 'Ride Cancelled'),
              ToggleStatusItem(label: 'Payment Received'),
              ToggleStatusItem(label: 'Refund Processed'),
              ToggleStatusItem(label: 'Account Verified'),
              ToggleStatusItem(label: 'Complaint Filed'),
              ToggleStatusItem(label: 'New User Registration'),
            ],
          ),
        ),
      ],
    );
  }
}

class ToggleStatusItem extends StatefulWidget {
  final String label;
  final bool initialValue;
  final Function(bool)? onChanged;

  const ToggleStatusItem({
    super.key,
    required this.label,
    this.initialValue = true,
    this.onChanged,
  });

  @override
  State<ToggleStatusItem> createState() => _ToggleStatusItemState();
}

class _ToggleStatusItemState extends State<ToggleStatusItem> {
  late bool _isChecked;

  @override
  void initState() {
    super.initState();
    _isChecked = widget.initialValue;
  }

  void _handleTap() {
    setState(() {
      _isChecked = !_isChecked;
    });
    if (widget.onChanged != null) {
      widget.onChanged!(_isChecked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      behavior: HitTestBehavior.opaque, // Ensures the whole row is clickable
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // The Checkbox Icon Container
            Container(
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(6),
              ),
              child: _isChecked
                  ? const Icon(Icons.check, size: 12, color: Colors.black54)
                  : null,
            ),
            const SizedBox(width: 12),
            // The Text Label
            Text(
              widget.label,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
                fontFamily: AppFonts.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
