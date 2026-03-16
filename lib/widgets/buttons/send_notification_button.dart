import 'package:carpool_admin/widgets/notifications_widgets/send_notification_dialog.dart';
import 'package:flutter/material.dart';
import '../../../utils/theme/colors.dart';
import '../../../utils/theme/fonts.dart';


class SendNotificationButton extends StatelessWidget {
  const SendNotificationButton({Key? key}) : super(key: key);

  void _showSendNotificationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const SendNotificationDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ElevatedButton.icon(
            onPressed: () => _showSendNotificationDialog(context),
            icon: const Icon(Icons.send, size: 18),
            label: const Text('Send Notification'),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.surface,
              foregroundColor: AppColors.textPrimary,
              elevation: 0,
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 14,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: const BorderSide(
                  color: AppColors.border,
                  width: 1,
                ),
              ),
              textStyle: const TextStyle(
                fontFamily: AppFonts.primary,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}