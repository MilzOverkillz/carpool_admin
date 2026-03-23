import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:carpool_admin/utils/theme/colors.dart';
import 'package:carpool_admin/utils/theme/fonts.dart';

class UsersDistributionChart extends StatelessWidget {
  final String title;
  final String subtitle;
  final String period;
  final double ridersPercent;
  final double driversPercent;

  const UsersDistributionChart({
    super.key,
    required this.title,
    required this.subtitle,
    required this.period,
    required this.ridersPercent,
    required this.driversPercent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 401,
      height: 400,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF000000).withOpacity(0.07),
            offset: const Offset(0, 8),
            blurRadius: 13,
            spreadRadius: -3,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// HEADER
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontFamily: AppFonts.primary,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: AppColors.black,
                      letterSpacing: -0.02
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontFamily: AppFonts.dmSans,
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: Color(0xff59595a)
                    ),
                  ),
                ],
              ),

              /// PERIOD TEXT
              Row(
                children: [
                  Text(
                    period,
                    style: TextStyle(
                      fontFamily: AppFonts.primary,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.02,
                      color: Color(0xFF59595a)
                    ),
                  ),
                  const SizedBox(width: 4),
                  const Icon(Icons.keyboard_arrow_down, size: 18),
                ],
              )
            ],
          ),

          const SizedBox(height: 20),

          /// PIE CHART
          Expanded(
            child: Transform.rotate(
              angle: 11,
              child: PieChart(
                PieChartData(
                  centerSpaceRadius: 0,
                  sectionsSpace: 0,
                  sections: [
                    PieChartSectionData(
                      value: ridersPercent,
                      color: const Color(0xFF6F6F6F),
                      radius: 80,
                      showTitle: false,
                    ),
                    PieChartSectionData(
                      value: driversPercent,
                      color: const Color(0xFFBDBDBD),
                      radius: 80,
                      showTitle: false,
                    ),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: 10),

          /// BOTTOM STATS
          Container(
            padding: const EdgeInsets.symmetric(vertical: 14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
            ),
            child: Row(
              children: [

                /// RIDERS
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          CircleAvatar(
                            radius: 4,
                            backgroundColor: Colors.black,
                          ),
                          SizedBox(width: 6),
                          Text("Riders", style: TextStyle(fontFamily: AppFonts.dmSans, fontWeight: FontWeight.w500, fontSize: 12, letterSpacing: -0.02, color: Color(0xff59595a)),),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "${ridersPercent.toInt()}%",
                        style: const TextStyle(
                          fontFamily: AppFonts.dmSans,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          letterSpacing: -0.02,
                          color: AppColors.black
                        ),
                      )
                    ],
                  ),
                ),

                /// DIVIDER
                Container(
                  height: 40,
                  width: 1,
                  color: Color(0xffF4F7FE),
                ),

                /// DRIVERS
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          CircleAvatar(
                            radius: 4,
                            backgroundColor: Color(0xFFBDBDBD),
                          ),
                          SizedBox(width: 6),
                          Text("Drivers", style: TextStyle(fontFamily: AppFonts.dmSans, fontWeight: FontWeight.w500, fontSize: 12, letterSpacing: -0.02, color: Color(0xff59595a)),),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "${driversPercent.toInt()}%",
                        style: const TextStyle(
                          fontFamily: AppFonts.dmSans,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          letterSpacing: -0.02,
                          color: AppColors.black
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}