import 'package:carpool_admin/utils/theme/colors.dart';
import 'package:carpool_admin/utils/theme/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DashboardStatCard extends StatelessWidget {
  final String title;
  final String value;
  final String change;
  final String iconPath;
  final String subtitle;
  final Color iconBackground;

  const DashboardStatCard({
    super.key,
    required this.title,
    required this.value,
    required this.change,
    required this.iconPath,
    this.subtitle = "since last month",
    this.iconBackground = const Color(0xFFE1E1E1),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        minWidth: 200,
        maxWidth: 300,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          /// LEFT TEXT
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                /// TITLE
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontFamily: AppFonts.dmSans,
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                    color: AppColors.black,
                  ),
                ),

                const SizedBox(height: 4),

                /// VALUE
                Text(
                  value,
                  style: TextStyle(
                    fontFamily: AppFonts.dmSans,
                    fontWeight: FontWeight.w700,
                    fontSize: 22,
                    color: AppColors.black,
                  ),
                ),

                const SizedBox(height: 6),

                /// CHANGE + SUBTITLE
                Row(
                  children: [
                    Text(
                      change,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF636363),
                      ),
                    ),
                    const SizedBox(width: 4),
                    Flexible(
                      child: Text(
                        subtitle,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(width: 12),

          /// ICON
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: iconBackground,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: SvgPicture.asset(
                iconPath,
                width: 20,
                height: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}