import 'package:flutter/material.dart';
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
  String _selectedRecipient = 'All Users';
  final List<String> _selectedChannels = [];

  @override
  void dispose() {
    _titleController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        width: 600,
        constraints: const BoxConstraints(maxHeight: 700),
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Send Notification',
                  style: TextStyle(
                    fontFamily: AppFonts.primary,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.close),
                  color: AppColors.textSecondary,
                ),
              ],
            ),
            const SizedBox(height: 24),
            
            // Title Input
            _buildLabel('Notification Title'),
            const SizedBox(height: 8),
            _buildTextField(
              controller: _titleController,
              hint: 'Enter notification title',
            ),
            const SizedBox(height: 20),
            
            // Message Input
            _buildLabel('Message'),
            const SizedBox(height: 8),
            _buildTextField(
              controller: _messageController,
              hint: 'Enter your message',
              maxLines: 5,
            ),
            const SizedBox(height: 20),
            
            // Recipients
            _buildLabel('Recipients'),
            const SizedBox(height: 8),
            _buildRecipientOptions(),
            const SizedBox(height: 20),
            
            // Channels
            _buildLabel('Channels'),
            const SizedBox(height: 8),
            _buildChannelOptions(),
            const SizedBox(height: 32),
            
            // Action Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                  ),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(
                      fontFamily: AppFonts.primary,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                ElevatedButton(
                  onPressed: _sendNotification,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Send Notification',
                    style: TextStyle(
                      fontFamily: AppFonts.primary,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontFamily: AppFonts.primary,
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    int maxLines = 1,
  }) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(
          fontFamily: AppFonts.primary,
          fontSize: 14,
          color: AppColors.textHint,
        ),
        filled: true,
        fillColor: AppColors.surface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: AppColors.border,
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: AppColors.border,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: AppColors.primary,
            width: 1.5,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
      ),
      style: const TextStyle(
        fontFamily: AppFonts.primary,
        fontSize: 14,
        color: AppColors.textPrimary,
      ),
    );
  }

  Widget _buildRecipientOptions() {
    final options = ['All Users', 'Specific User', 'Specific Company'];
    return Wrap(
      spacing: 12,
      children: options.map((option) {
        final isSelected = _selectedRecipient == option;
        return ChoiceChip(
          label: Text(option),
          selected: isSelected,
          onSelected: (selected) {
            setState(() => _selectedRecipient = option);
          },
          backgroundColor: AppColors.surfaceSecondary,
          selectedColor: AppColors.primary,
          labelStyle: TextStyle(
            fontFamily: AppFonts.primary,
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: isSelected ? Colors.white : AppColors.textPrimary,
          ),
          side: BorderSide(
            color: isSelected ? AppColors.primary : AppColors.border,
            width: 1,
          ),
        );
      }).toList(),
    );
  }

  Widget _buildChannelOptions() {
    final channels = ['Email', 'Push', 'SMS'];
    return Wrap(
      spacing: 12,
      children: channels.map((channel) {
        final isSelected = _selectedChannels.contains(channel);
        return FilterChip(
          label: Text(channel),
          selected: isSelected,
          onSelected: (selected) {
            setState(() {
              if (selected) {
                _selectedChannels.add(channel);
              } else {
                _selectedChannels.remove(channel);
              }
            });
          },
          backgroundColor: AppColors.surfaceSecondary,
          selectedColor: AppColors.primary,
          checkmarkColor: Colors.white,
          labelStyle: TextStyle(
            fontFamily: AppFonts.primary,
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: isSelected ? Colors.white : AppColors.textPrimary,
          ),
          side: BorderSide(
            color: isSelected ? AppColors.primary : AppColors.border,
            width: 1,
          ),
        );
      }).toList(),
    );
  }

  void _sendNotification() {
    // Validate inputs
    if (_titleController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a notification title')),
      );
      return;
    }
    
    if (_messageController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a message')),
      );
      return;
    }
    
    if (_selectedChannels.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select at least one channel')),
      );
      return;
    }

    // Close dialog and show success
    Navigator.of(context).pop();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Notification sent successfully!'),
        backgroundColor: AppColors.success,
      ),
    );
  }
}