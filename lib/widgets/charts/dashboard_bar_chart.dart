import 'package:carpool_admin/utils/theme/colors.dart';
import 'package:carpool_admin/utils/theme/fonts.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class DashboardBarChart extends StatelessWidget {
  final String title;
  final String subtitle;
  final List<double> values;
  final List<String> labels;
  final Color barColor;

  const DashboardBarChart({
    super.key,
    required this.title,
    required this.subtitle,
    required this.values,
    required this.labels,
    this.barColor = const Color(0xFF78797B),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 970,
      height: 400,
      padding: const EdgeInsets.all(24),
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
          /// TITLE
          Text(
            title,
            style: TextStyle(
              fontFamily: AppFonts.primary,
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: AppColors.black,
            ),
          ),

          const SizedBox(height: 4),

          Text(
            subtitle,
            style: TextStyle(
              fontFamily: AppFonts.dmSans,
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Color(0xFFa3aed0),
            ),
          ),

          const SizedBox(height: 24),

          /// CHART
          Expanded(
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,
                maxY: 400,
                minY: 0,
                gridData: FlGridData(
                  drawVerticalLine: false,
                  horizontalInterval: 100,
                  checkToShowHorizontalLine: (value) {
                    return value % 100 == 0;
                  },
                  getDrawingHorizontalLine: (value) {
                    return FlLine(
                      color: const Color(0xFFE5E7EB),
                      strokeWidth: 1,
                      dashArray: [5, 5],
                    );
                  },
                ),

                borderData: FlBorderData(show: false),

                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 40,
                      interval: 100,
                      getTitlesWidget: (value, meta) {
                        if (value % 100 != 0) return const SizedBox();
                        return Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Text(
                            value.toInt().toString(),
                            style: const TextStyle(
                              fontFamily: AppFonts.primary,
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: AppColors.black,
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  rightTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),

                  topTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),

                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 32,
                      getTitlesWidget: (value, meta) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            labels[value.toInt()],
                            style: const TextStyle(
                              fontFamily: AppFonts.primary,
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: AppColors.black,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),

                barGroups: List.generate(
                  values.length,
                  (index) => BarChartGroupData(
                    x: index,
                    barRods: [
                      BarChartRodData(
                        toY: values[index],
                        width: 24,
                        borderRadius: BorderRadius.circular(6),
                        color: barColor,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
