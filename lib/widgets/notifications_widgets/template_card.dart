import 'package:flutter/material.dart';
import '../../../utils/models/notification_dummy_data.dart';
import '../../../utils/theme/colors.dart';
import '../../../utils/theme/fonts.dart';
import '../../../utils/theme/text_styles.dart';

class TemplateCard extends StatelessWidget {
  final NotificationTemplate template;

  const TemplateCard({Key? key, required this.template}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.pillBox, width: 1.2),
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Left side - Template info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title and Category tag
                  Row(
                    children: [
                      Text(
                        template.title,
                        style: AppTextStyles.bodyLarge.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(width: 10),
                      _buildCategoryTag(template.categoryLabel),
                    ],
                  ),
                  const SizedBox(height: 6),
                  // Message with template variables
                  Text(
                    template.message,
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: AppColors.blackTextTitleTem,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),

            const SizedBox(width: 24),

            // Right side - Action buttons
            Align(
              alignment: Alignment.center,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildActionButton(
                    label: 'Edit',
                    onTap: () {
                      // No action - just for UI
                    },
                  ),
                  const SizedBox(width: 12),
                  _buildActionButton(
                    label: 'Use',
                    onTap: () {
                      // No action - just for UI
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryTag(String category) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.pillBox,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        category,
        style: const TextStyle(
          fontFamily: AppFonts.primary,
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: AppColors.black,
        ),
      ),
    );
  }

  Widget _buildActionButton({
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(6),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
        decoration: BoxDecoration(
          color: AppColors.pillBox2,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          label,
          style: const TextStyle(
            fontFamily: AppFonts.primary,
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.black,
          ),
        ),
      ),
    );
  }
}
