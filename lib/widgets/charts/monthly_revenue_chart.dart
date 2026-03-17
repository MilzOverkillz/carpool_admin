import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:carpool_admin/utils/theme/fonts.dart';
import 'package:carpool_admin/utils/theme/colors.dart';

class MonthlyRevenueChart extends StatelessWidget {
  final List<double> year2020;
  final List<double> year2021;

  const MonthlyRevenueChart({
    super.key,
    required this.year2020,
    required this.year2021,
  });

  @override
  Widget build(BuildContext context) {
    final months = [
      "Jan","Feb","Mar","Apr","May","Jun",
      "Jul","Aug","Sept","Oct","Nov","Des"
    ];

    return Container(
      height: 430,
      padding: const EdgeInsets.symmetric(horizontal: 69.5, vertical: 36),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
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
                    "Monthly Revenue",
                    style: TextStyle(
                      fontFamily: AppFonts.primary,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: AppColors.black,
                    ),
                  ),

                  const SizedBox(height: 4),

                  Text(
                    "Monthly revenue over full of year",
                    style: TextStyle(
                      fontFamily: AppFonts.dmSans,
                      fontSize: 12,
                      color: const Color(0xFFA3AED0),
                    ),
                  ),
                ],
              ),

              /// LEGEND
              Row(
                children: const [
                  _LegendDot(color: Colors.black, text: "2020"),
                  SizedBox(width: 16),
                  _LegendDot(color: Color(0xFFBDBDBD), text: "2021"),
                ],
              )
            ],
          ),

          const SizedBox(height: 20),

          /// CHART
          Expanded(
            child: LineChart(
              LineChartData(
                minY: 0,
                maxY: 40000,

                gridData: FlGridData(
                  drawVerticalLine: true,
                  horizontalInterval: 10000,
                ),

                borderData: FlBorderData(show: false),

                titlesData: FlTitlesData(

                  /// LEFT AMOUNT
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: 10000,
                      reservedSize: 50,
                      getTitlesWidget: (value, meta) {
                        return Text(
                          "\$${(value / 1000).toInt()}k",
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
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

                  /// BOTTOM MONTHS
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: 1,
                      getTitlesWidget: (value, meta) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            months[value.toInt()],
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),

                lineBarsData: [

                  /// 2020 LINE
                  LineChartBarData(
                    spots: List.generate(
                      year2020.length,
                      (i) => FlSpot(i.toDouble(), year2020[i]),
                    ),
                    isCurved: true,
                    color: Colors.black,
                    barWidth: 3,
                    dotData: FlDotData(show: false),
                  ),

                  /// 2021 LINE
                  LineChartBarData(
                    spots: List.generate(
                      year2021.length,
                      (i) => FlSpot(i.toDouble(), year2021[i]),
                    ),
                    isCurved: true,
                    color: const Color(0xFFBDBDBD),
                    barWidth: 3,
                    dotData: FlDotData(show: false),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// LEGEND WIDGET
class _LegendDot extends StatelessWidget {
  final Color color;
  final String text;

  const _LegendDot({required this.color, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(radius: 6, backgroundColor: color),
        const SizedBox(width: 6),
        Text(
          text,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        )
      ],
    );
  }
}