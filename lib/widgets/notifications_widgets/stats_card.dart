import 'package:flutter/material.dart';
import '../../../utils/theme/colors.dart';
import '../../../utils/theme/text_styles.dart';
import '../../../utils/theme/app_sizes.dart';

class StatsCard extends StatelessWidget {
  final String label;
  final String value;
  final IconData? icon;
  final String? iconAsset;

  const StatsCard({
    Key? key,
    required this.label,
    required this.value,
    this.icon,
    this.iconAsset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppSizes.radiusXl),
        border: Border.all(
          color: AppColors.divider,
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.textSecondary,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  value,
                  style: AppTextStyles.displayMedium.copyWith(
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: AppColors.tabsSelection,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: iconAsset != null
                  ? Image.asset(
                      iconAsset!,
                      width: 24,
                      height: 24,
                      color: AppColors.textSecondary,
                    )
                  : Icon(
                      icon ?? Icons.notifications_outlined,
                      color: AppColors.textSecondary,
                      size: 24,
                    ),
            ),
          ),
        ],
      ),
    );
  }
}