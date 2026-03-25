import 'package:flutter/material.dart';
import '../../../utils/models/notification_dummy_data.dart';
import '../../../utils/theme/colors.dart';
import '../buttons/send_notification_button.dart';
import 'template_card.dart';

class TemplatesTab extends StatelessWidget {
  const TemplatesTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Create Template Button - Using SendNotificationButton with custom parameters
        const SendNotificationButton(
          buttonText: 'Create Template',
          iconAsset: 'assets/icons/notification_icons/add_template.svg',
          showDialogOnPress: false, // Don't show dialog when pressed
        ),
        
        // Templates List Container
        Container(
          height: 450,
          margin: const EdgeInsets.fromLTRB(0, 8, 24, 0),
          decoration: BoxDecoration(
            color: AppColors.surface,
            border: Border.all(color: AppColors.tableBorder, width: 1),
            boxShadow: [
              // Left shadow (light)
              BoxShadow(
                color: Colors.black.withOpacity(0.02),
                offset: const Offset(-2, 0),
                blurRadius: 6,
              ),
              // Right shadow (light)
              BoxShadow(
                color: Colors.black.withOpacity(0.02),
                offset: const Offset(2, 0),
                blurRadius: 6,
              ),
              // Bottom shadow (darker)
              BoxShadow(
                color: Colors.black.withOpacity(0.06),
                offset: const Offset(-1, 9),
                blurRadius: 10,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Template Cards List
                  ...NotificationDummyData.templates.asMap().entries.map((entry) {
                    final index = entry.key;
                    final template = entry.value;
                    return Column(
                      children: [
                        TemplateCard(template: template),
                        if (index < NotificationDummyData.templates.length - 1)
                          const SizedBox(height: 16),
                      ],
                    );
                  }).toList(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
