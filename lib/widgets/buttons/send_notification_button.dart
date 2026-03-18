import 'package:carpool_admin/utils/theme/app_sizes.dart';
import 'package:carpool_admin/widgets/notifications_widgets/send_notification_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ElevatedButton.icon(
            onPressed: () => _showSendNotificationDialog(context),
            icon: SvgPicture.asset(
              'assets/icons/notification_icons/send.svg',
              width: 18,
              height: 18,
            ),
            label: const Text('Send Notification'),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.sendNotificationButton,
              foregroundColor: AppColors.black,
              elevation: 0,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSizes.radiusMd),
              ),
              textStyle: const TextStyle(
                fontFamily: AppFonts.primary,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
