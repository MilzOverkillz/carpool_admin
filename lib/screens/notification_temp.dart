import 'package:carpool_admin/utils/theme/fonts.dart';
import 'package:carpool_admin/widgets/settngs/privacy_compliance.dart';
import 'package:carpool_admin/widgets/settngs/toggle_status_item.dart';
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
    return Column(
      children: [
        // Notification Channels Card
        Card(
          color: const Color(0xFFFFFFFF),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Notification Channels',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF212B36),
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
          ),
        ),

        const SizedBox(height: 16),

        // System Notifications Card
        Card(
          color: const Color(0xFFFFFFFF),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'System Notifications',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF212B36),
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
          ),
        ),
      ],
    );
  }
}
