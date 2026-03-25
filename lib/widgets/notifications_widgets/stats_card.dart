import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../utils/theme/colors.dart';
import '../../../utils/theme/text_styles.dart';
import '../../../utils/theme/app_sizes.dart';

class StatsCard extends StatelessWidget {
  final String label;
  final String value;
  final IconData? icon;
  final String? iconAsset;
  final Widget? persentage;

  const StatsCard({
    Key? key,
    required this.label,
    required this.value,
    this.icon,
    this.iconAsset,
    this.persentage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
      decoration: BoxDecoration(
        color: Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(AppSizes.radiusXXl),
        border: Border.all(color: AppColors.tabsSelection, width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04), // very light shadow
            blurRadius: 1.4, // softness
            offset: Offset(0, 1), // position (x, y)
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: AppTextStyles.statesCardLabel.copyWith()),
                const SizedBox(height: 8),
                Text(value, style: AppTextStyles.statesCardValue.copyWith()),
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
            decoration: BoxDecoration(
              color: AppColors.tabsSelection,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: iconAsset != null
                  ? SvgPicture.asset(iconAsset!, width: 24, height: 24)
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