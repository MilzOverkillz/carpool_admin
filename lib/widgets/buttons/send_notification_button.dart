import 'package:carpool_admin/utils/theme/app_sizes.dart';
import 'package:carpool_admin/widgets/notifications_widgets/send_notification_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../utils/theme/colors.dart';
import '../../../utils/theme/fonts.dart';

class SendNotificationButton extends StatelessWidget {
  final String? buttonText;
  final String? iconAsset;
  final IconData? iconData;
  final VoidCallback? onPressed;
  final bool showDialogOnPress;

  const SendNotificationButton({
    Key? key,
    this.buttonText,
    this.iconAsset,
    this.iconData,
    this.onPressed,
    this.showDialogOnPress = true,
  }) : super(key: key);

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
            onPressed: _getOnPressedCallback(context),
            icon: _buildIcon(),
            label: Text(buttonText ?? 'Send Notification'),
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

  VoidCallback? _getOnPressedCallback(BuildContext context) {
    // If custom onPressed is provided, use it
    if (onPressed != null) {
      return onPressed;
    }
    
    // If showDialogOnPress is true and no custom callback, show dialog
    if (showDialogOnPress) {
      return () => _showSendNotificationDialog(context);
    }
    
    // Otherwise, return empty callback (button does nothing)
    return () {};
  }

  Widget _buildIcon() {
    // If iconAsset is provided, use SVG
    if (iconAsset != null) {
      return SvgPicture.asset(
        iconAsset!,
        width: 16,
        height: 16,
      );
    }
    // If iconData is provided, use Icon
    else if (iconData != null) {
      return Icon(
        iconData,
        size: 18,
      );
    }
    // Default to send icon
    else {
      return SvgPicture.asset(
        'assets/icons/notification_icons/send.svg',
        width: 18,
        height: 18,
      );
    }
  }
}