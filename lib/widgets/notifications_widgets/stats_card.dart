import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/theme/app_sizes.dart';
import '../../../utils/theme/colors.dart';
import '../../../utils/theme/text_styles.dart';

class StatsCard extends StatelessWidget {
  final String label;
  final String value;
  final IconData? icon;
  final String? iconAsset;
  final Widget? persentage;

  const StatsCard({
    super.key, // Modern super parameter syntax
    required this.label,
    required this.value,
    this.icon,
    this.iconAsset,
    this.persentage,
  }); // Redundant ": super(key: key)" removed to fix the error

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(AppSizes.radiusXXl),
        border: Border.all(color: AppColors.tabsSelection, width: 2),
        boxShadow: [
          BoxShadow(
            // Updated from .withOpacity to .withValues per Flutter 3.27+ standards
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 1.4,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: AppTextStyles.statesCardLabel,
                ),
                const SizedBox(height: 8),
                Text(
                  value,
                  style: AppTextStyles.statesCardValue,
                ),
                if (persentage != null) ...[
                  const SizedBox(height: 8),
                  persentage!,
                ],
              ],
            ),
          ),
          const SizedBox(width: 12),
          Container(
            width: 52,
            height: 52,
            decoration: const BoxDecoration(
              color: AppColors.tabsSelection,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: iconAsset != null
                  ? SvgPicture.asset(
                      iconAsset!,
                      width: 24,
                      height: 24,
                    )
                  : Icon(
                      icon ?? Icons.notifications_outlined,
                      color: AppColors.black,
                      size: 24,
                    ),
            ),
          ),
        ],
      ),
    );
  }
}