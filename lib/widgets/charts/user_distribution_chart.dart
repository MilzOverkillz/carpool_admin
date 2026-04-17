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
  final double? height;

  const UsersDistributionChart({
    super.key,
    required this.title,
    required this.subtitle,
    required this.period,
    required this.ridersPercent,
    required this.driversPercent,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: LayoutBuilder(
        builder: (context, constraints) {
        final bool isSmall = constraints.maxWidth < 700;

        return ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: isSmall ? 310 : 375,
          ),
          child: AspectRatio(
            aspectRatio: isSmall ? 1.05 : 0.9,
            child: Container(
              padding: EdgeInsets.all(isSmall ? 16 : 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.07),
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
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontFamily: AppFonts.primary,
                                fontSize: isSmall ? 16 : 18,
                                fontWeight: FontWeight.w700,
                                color: AppColors.black,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              subtitle,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 12,
                                color: Color(0xff59595a),
                              ),
                            ),
                          ],
                        ),
                      ),

                      Row(
                        children: const [
                          Text(
                            "Weekly",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF59595a),
                            ),
                          ),
                          SizedBox(width: 4),
                          Icon(Icons.keyboard_arrow_down, size: 18),
                        ],
                      )
                    ],
                  ),

                  SizedBox(height: isSmall ? 12 : 16),

                  /// PIE CHART
                  Expanded(
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        final size = constraints.maxWidth * (isSmall ? 0.45 : 0.35);

                        return Center(
                          child: SizedBox(
                            width: size,
                            height: size,
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
                                      radius: size / 2,
                                      showTitle: false,
                                    ),
                                    PieChartSectionData(
                                      value: driversPercent,
                                      color: const Color(0xFFBDBDBD),
                                      radius: size / 2,
                                      showTitle: false,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  SizedBox(height: isSmall ? 6 : 10),

                  /// FOOTER
                  Container(
                    padding: EdgeInsets.symmetric(vertical: isSmall ? 10 : 14),
                    child: Row(
                      children: [

                        /// RIDERS
                        Expanded(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  CircleAvatar(radius: 4, backgroundColor: Colors.black),
                                  SizedBox(width: 6),
                                  Text("Riders", style: TextStyle(fontSize: 12)),
                                ],
                              ),
                              const SizedBox(height: 4),
                              Text(
                                "${ridersPercent.toInt()}%",
                                style: TextStyle(
                                  fontSize: isSmall ? 16 : 18,
                                  fontWeight: FontWeight.w700,
                                ),
                              )
                            ],
                          ),
                        ),

                        Container(height: 40, width: 1, color: Color(0xffF4F7FE)),

                        /// DRIVERS
                        Expanded(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  CircleAvatar(radius: 4, backgroundColor: Color(0xFFBDBDBD)),
                                  SizedBox(width: 6),
                                  Text("Drivers", style: TextStyle(fontSize: 12)),
                                ],
                              ),
                              const SizedBox(height: 4),
                              Text(
                                "${driversPercent.toInt()}%",
                                style: TextStyle(
                                  fontSize: isSmall ? 16 : 18,
                                  fontWeight: FontWeight.w700,
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
            ),
          ),
        );
        },
      ),
    );
  }
}