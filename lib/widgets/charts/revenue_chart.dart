import 'package:carpool_admin/utils/theme/colors.dart';
import 'package:carpool_admin/utils/theme/fonts.dart';
import 'package:carpool_admin/utils/theme/text_styles.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class RevenueRidesChart extends StatefulWidget {
  const RevenueRidesChart({super.key});

  @override
  State<RevenueRidesChart> createState() => _RevenueRidesChartState();
}

class _RevenueRidesChartState extends State<RevenueRidesChart> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.black),
        ),
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ChartHeader(),

              const SizedBox(height: 25),
              SizedBox(
                height: 200,
                width: MediaQuery.of(context).size.width * 0.65,
                child: LineChart(
                  LineChartData(
                    minY: 0,
                    maxY: 28000,
                    gridData: const FlGridData(show: false),
                    borderData: FlBorderData(
                      show: true,
                      border: Border(
                        bottom: BorderSide(color: Colors.grey.withOpacity(0.2)),
                        left: BorderSide(color: Colors.grey.withOpacity(0.2)),
                        right: BorderSide(color: Colors.grey.withOpacity(0.2)),
                      ),
                    ),
                    titlesData: _buildTitles(),
                    lineBarsData: [
                      _lineData(isRevenue: true),
                      _lineData(isRevenue: false),
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

  LineChartBarData _lineData({required bool isRevenue}) {
    final revenueSpots = const [
      FlSpot(0, 14000),
      FlSpot(1, 10000),
      FlSpot(2, 26000),
      FlSpot(3, 10000),
      FlSpot(4, 23000),
      FlSpot(5, 16000),
    ];

    final ridesSpots = const [
      FlSpot(0, 19000),
      FlSpot(1, 7000),
      FlSpot(2, 24000),
      FlSpot(3, 6000),
      FlSpot(4, 28000),
      FlSpot(5, 18000),
    ];

    return LineChartBarData(
      spots: isRevenue ? revenueSpots : ridesSpots,
      isCurved: true,
      curveSmoothness: 0.4,
      color: isRevenue ? Colors.black : Colors.grey.shade300,
      barWidth: 4,
      isStrokeCapRound: true,
      dotData: const FlDotData(show: false),
      belowBarData: BarAreaData(show: false),
    );
  }

  FlTitlesData _buildTitles() {
    const sideTextStyle = TextStyle(color: Colors.grey, fontSize: 12);
    return FlTitlesData(
      topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
      leftTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 40,
          interval: 6000,
          getTitlesWidget: (val, _) => Text(
            val.toInt().toString(),
            style: sideTextStyle.copyWith(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              fontFamily: AppFonts.nunitoSans,
              color: Colors.black,
            ),
          ),
        ),
      ),
      rightTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 40,
          interval: 6000,
          getTitlesWidget: (val, _) => Text(
            val.toInt().toString(),
            style: sideTextStyle.copyWith(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              fontFamily: AppFonts.nunitoSans,
              color: Colors.black,
            ),
          ),
        ),
      ),
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          interval: 1,
          getTitlesWidget: (value, _) {
            const months = ['Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
            if (value.toInt() < months.length) {
              return Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  months[value.toInt()],
                  style: sideTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    fontFamily: AppFonts.nunitoSans,
                    color: Colors.black,
                  ),
                ),
              );
            }
            return const Text('');
          },
        ),
      ),
    );
  }
}

class ChartHeader extends StatelessWidget {
  const ChartHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left Title
          const Text(
            'Over the 7 month',
            style: TextStyle(
              fontFamily: AppFonts.primary,
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),

          // Right Legend Items
          Row(
            children: [
              _buildLegendItem(Colors.black, 'Revenue'),
              const SizedBox(width: 16),
              _buildLegendItem(Colors.grey.shade300, 'Rides'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLegendItem(Color color, String label) {
    return Row(
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 6),
        Text(
          label,
          style: const TextStyle(
            fontFamily: AppFonts.nunitoSans,
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
