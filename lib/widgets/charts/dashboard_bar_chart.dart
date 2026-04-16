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

  final double? width;
  final double? height;

  const DashboardBarChart({
    super.key,
    required this.title,
    required this.subtitle,
    required this.values,
    required this.labels,
    this.barColor = const Color(0xFF78797B),
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isSmall =
            (width == null) && constraints.maxWidth < 700;

        return Container(
          width: width ?? (isSmall ? 770 : 1170),
          height: height ?? (isSmall ? 320 : 417),

          padding: EdgeInsets.all(isSmall ? 16 : 24),
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
                  fontSize: isSmall ? 16 : 18,
                  fontWeight: FontWeight.w700,
                  color: AppColors.black,
                ),
              ),

              const SizedBox(height: 4),

              Text(
                subtitle,
                style: const TextStyle(
                  fontFamily: AppFonts.dmSans,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFFa3aed0),
                ),
              ),

              SizedBox(height: isSmall ? 16 : 24),

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
                          reservedSize: isSmall ? 30 : 40,
                          interval: 100,
                          getTitlesWidget: (value, meta) {
                            if (value % 100 != 0) return const SizedBox();
                            return Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Text(
                                value.toInt().toString(),
                                style: TextStyle(
                                  fontFamily: AppFonts.primary,
                                  fontWeight: FontWeight.w400,
                                  fontSize: isSmall ? 12 : 14,
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
                          reservedSize: isSmall ? 26 : 32,
                          getTitlesWidget: (value, meta) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Text(
                                labels[value.toInt()],
                                style: TextStyle(
                                  fontFamily: AppFonts.primary,
                                  fontWeight: FontWeight.w500,
                                  fontSize: isSmall ? 12 : 14,
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
                            width: isSmall ? 14 : 24,
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
      },
    );
  }
}