import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../utils/theme/colors.dart';
import '../../../utils/theme/fonts.dart';

class SendNotificationDialog extends StatefulWidget {
  const SendNotificationDialog({Key? key}) : super(key: key);

  @override
  State<SendNotificationDialog> createState() => _SendNotificationDialogState();
}

class _SendNotificationDialogState extends State<SendNotificationDialog> {
  final _titleController = TextEditingController();
  final _messageController = TextEditingController();

  // State to manage selection of each channel
  bool _emailSelected = true;
  bool _pushSelected = true;
  bool _smsSelected = false;
  bool _inAppSelected = false;

  @override
  void dispose() {
    _titleController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.surface,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      child: Container(
        width: 550, // Set to match the aspect ratio in the image
        padding: const EdgeInsets.fromLTRB(44, 44, 44, 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header with Title, Subtitle, and Close Button
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Send Notification',
                          style: TextStyle(
                            fontFamily: AppFonts.primary,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: AppColors.blackTextTitle,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          'Send push/email notifications to users or companies',
                          style: TextStyle(
                            fontFamily: AppFonts.dmSans,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.blackText200,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.close_rounded, size: 24),
                    color: AppColors.textPrimary,
                  ),
                ],
              ),
              const SizedBox(height: 30),

              // Notification Type Dropdown
              _buildDropdownField(
                label: 'Notification Type',
                hint: 'Select type',
              ),
              const SizedBox(height: 20),

              // Recipients Dropdown with the exact typo from the image
              _buildDropdownField(
                label: 'Recipients',
                hint: 'Select reecipient',
              ),
              const SizedBox(height: 20),

              // Use Template Dropdown (Optional)
              _buildDropdownField(
                label: 'Use Template (Optional)',
                hint: 'Select template',
              ),
              const SizedBox(height: 20),

              // Title Input Field
              _buildTextField(
                label: 'Title',
                controller: _titleController,
                hint: 'Enter notification title',
              ),
              const SizedBox(height: 20),

              // Message Input Field with multiple lines
              _buildTextField(
                label: 'Message',
                controller: _messageController,
                hint: 'Enter notification message',
                maxLines: 3,
              ),
              const SizedBox(height: 12),

              // Channels Selection with fixed custom checkboxes
              const Text(
                'Channels',
                style: TextStyle(
                  fontFamily: AppFonts.primary,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 10),
              Wrap(
                spacing: 24,
                runSpacing: 12,
                children: [
                  _buildCustomCheckbox(
                    label: 'Email',
                    isSelected: _emailSelected,
                    onTap: () =>
                        setState(() => _emailSelected = !_emailSelected),
                  ),
                  _buildCustomCheckbox(
                    label: 'Push',
                    isSelected: _pushSelected,
                    onTap: () => setState(() => _pushSelected = !_pushSelected),
                  ),
                  _buildCustomCheckbox(
                    label: 'SMS',
                    isSelected: _smsSelected,
                    onTap: () => setState(() => _smsSelected = !_smsSelected),
                  ),
                  _buildCustomCheckbox(
                    label: 'In-app',
                    isSelected: _inAppSelected,
                    onTap: () =>
                        setState(() => _inAppSelected = !_inAppSelected),
                  ),
                ],
              ),
              const SizedBox(height: 22),

              // Action Buttons: Save as Draft and Send Now
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // Save as Draft Button: white bg, grey border
                  _buildSaveDraftButton(context),
                  const SizedBox(width: 20),
                  // Send Now Button: filled dark grey, with icon
                  _buildSendNowButton(context),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper widget to build visually-accurate dropdown fields
  Widget _buildDropdownField({required String label, required String hint}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontFamily: AppFonts.primary,
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.black,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColors.border),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                hint,
                style: const TextStyle(
                  fontFamily: AppFonts.primary,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textHint,
                ),
              ),
              const Icon(
                Icons.keyboard_arrow_down_rounded,
                color: AppColors.textPrimary,
                size: 22,
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Helper widget to build visually-accurate text fields
  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    required String hint,
    int maxLines = 1,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontFamily: AppFonts.primary,
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.black,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          maxLines: maxLines,
          style: const TextStyle(
            fontFamily: AppFonts.primary,
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.textPrimary,
          ),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(
              fontFamily: AppFonts.primary,
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.textHint2,
            ),
            filled: true,
            fillColor: AppColors.surface,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: AppColors.border, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: AppColors.primary,
                width: 1.5,
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Fixed custom checkbox widget to show checkmark correctly when selected
  Widget _buildCustomCheckbox({
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 17,
            height: 17,
            decoration: BoxDecoration(
              // Logic simplified to: black background when selected, light gray when not.
              color: isSelected ? AppColors.black : AppColors.blackText100,
              borderRadius: BorderRadius.circular(5),
            ),
            // The check icon is now purely conditional on selection state.
            child: isSelected
                ? const Icon(Icons.check_rounded, size: 12, color: Colors.white)
                : null,
          ),
          const SizedBox(width: 8),
          Text(
            label,
            style: const TextStyle(
              fontFamily: AppFonts.primary,
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppColors.black,
            ),
          ),
        ],
      ),
    );
  }

  // Helper function to build the visually-accurate 'Save as Draft' button
  Widget _buildSaveDraftButton(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        // Implement logic for 'Save as Draft' here
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Notification saved as draft!'),
            backgroundColor: AppColors.info,
          ),
        );
      },
      style: OutlinedButton.styleFrom(
        side: const BorderSide(
          color: Color(0xFFC0C0C0),
          width: 1,
        ), // Light grey border as in image
        backgroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: const Text(
        'Save as Draft',
        style: TextStyle(
          fontFamily: AppFonts.primary,
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Colors.black, // Exact color as shown in image
        ),
      ),
    );
  }

  // Helper function to build the visually-accurate 'Send Now' button
  Widget _buildSendNowButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Implement validation and sending logic here
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Notification sent now!'),
            backgroundColor: AppColors.success,
          ),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.blackText400, // Use primary dark or close match from image
        elevation: 2,
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            "assets/icons/notification_icons/send.svg",
            width: 18,
            height: 18,
            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),
          const SizedBox(width: 4),
          const Text(
            'Send Now',
            style: TextStyle(
              fontFamily: AppFonts.primary,
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
