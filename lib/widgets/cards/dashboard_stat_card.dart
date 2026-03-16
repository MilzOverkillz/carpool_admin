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
      width: 245,
      height: 98,
      padding: const EdgeInsets.only(top: 14, left: 23, right: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /// LEFT TEXT SECTION
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontFamily: AppFonts.dmSans,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  letterSpacing: -0.02,
                  color: AppColors.black,
                ),
              ),

              Text(
                value,
                style: TextStyle(
                  fontFamily: AppFonts.dmSans,
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  letterSpacing: -0.02,
                  color: AppColors.black,
                ),
              ),
              SizedBox(height: 9,),
              Row(
                children: [
                  Text(
                    change,
                    style: TextStyle(
                      fontFamily: AppFonts.dmSans,
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                      letterSpacing: -0.02,
                      color: const Color(0xFF636363),
                    ),
                  ),
                  Text(
                    " $subtitle",
                    style: TextStyle(
                      fontFamily: AppFonts.dmSans,
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      letterSpacing: -0.02,
                      color: AppColors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),

          /// RIGHT ICON
          Container(
            margin: const EdgeInsets.only(bottom: 24),
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: iconBackground,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: SvgPicture.asset(
                iconPath,
                width: 21.88,
                height: 25,
              ),
            ),
          ),
        ],
      ),
    );
  }
}