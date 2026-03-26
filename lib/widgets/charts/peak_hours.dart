import 'package:carpool_admin/utils/theme/fonts.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PeakHoursChart extends StatefulWidget {
  const PeakHoursChart({super.key});

  @override
  State<PeakHoursChart> createState() => _PeakHoursChartState();
}

class _PeakHoursChartState extends State<PeakHoursChart> {
  final List<FlSpot> _spots = const [
    FlSpot(6, 10),
    FlSpot(7, 25),
    FlSpot(8, 15),
    FlSpot(9, 45),
    FlSpot(10, 40),
    FlSpot(11, 15),
    FlSpot(12, 18),
    FlSpot(13, 12),
    FlSpot(14, 28),
    FlSpot(15, 8),
    FlSpot(16, 22),
    FlSpot(17, 18),
    FlSpot(18, 48),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: MediaQuery.of(context).size.width * 0.75,
      child: AspectRatio(
        aspectRatio: 3,
        child: LineChart(
          LineChartData(
            gridData: const FlGridData(show: false),
            titlesData: _buildTitlesData(),
            borderData: FlBorderData(show: false),
            lineTouchData: _buildTouchData(),
            lineBarsData: [
              LineChartBarData(
                spots: _spots,
                isCurved: true,
                curveSmoothness: 0.35,
                color: Colors.black,
                barWidth: 3,
                isStrokeCapRound: true,
                dotData: _buildDotData(),
                belowBarData: BarAreaData(
                  show: true,
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0.3),
                      Colors.black.withOpacity(0.0),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  FlTitlesData _buildTitlesData() {
    return FlTitlesData(
      rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
      topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
      leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          interval: 1,
          getTitlesWidget: (value, meta) {
            String text = '';
            int hour = value.toInt();
            if (hour == 12) {
              text = '12 PM';
            } else if (hour > 12) {
              text = '${hour - 12} PM';
            } else {
              text = '$hour AM';
            }
            return Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF464255),
                  fontFamily: AppFonts.primary,
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  LineTouchData _buildTouchData() {
    return LineTouchData(
      touchTooltipData: LineTouchTooltipData(
        getTooltipColor: (touchedSpot) => Colors.white,
        tooltipPadding: const EdgeInsets.all(12),
        getTooltipItems: (List<LineBarSpot> touchedBarSpots) {
          return touchedBarSpots.map((barSpot) {
            return LineTooltipItem(
              '${barSpot.y.toInt()} Ride\n',
              const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              children: [
                const TextSpan(
                  text: 'Oct 18th, 2025',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.normal,
                    fontSize: 12,
                  ),
                ),
              ],
            );
          }).toList();
        },
      ),
    );
  }

  FlDotData _buildDotData() {
    return FlDotData(
      show: true,
      getDotPainter: (spot, percent, barData, index) {
        if (index == 4) {
          return FlDotCirclePainter(
            radius: 8,
            color: Colors.black,
            strokeWidth: 4,
            strokeColor: Colors.white,
          );
        }
        return FlDotCirclePainter(radius: 0);
      },
    );
  }
}
