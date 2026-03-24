import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:carpool_admin/utils/theme/fonts.dart';
import 'package:carpool_admin/utils/theme/colors.dart';

class MonthlyRevenueChart extends StatelessWidget {
  // ── Data ──────────────────────────────────────────────────────────────────
  final List<double> year2020;
  final List<double> year2021;

  // ── Header ────────────────────────────────────────────────────────────────
  final String title;
  final String subtitle;
  final Color subtitleColor;

  // ── Legend ────────────────────────────────────────────────────────────────
  final String line1Label;
  final String line2Label;
  final bool showLegend;

  // ── Line colors ───────────────────────────────────────────────────────────
  final Color line1Color;
  final Color line2Color;

  // ── Dot highlights ────────────────────────────────────────────────────────
  /// Index of the primary highlighted dot (dark filled, dark tooltip)
  final int? primaryDotIndex;

  /// Index of the secondary highlighted dot (grey filled, light tooltip)
  final int? secondaryDotIndex;

  // ── Dashed verticals ──────────────────────────────────────────────────────
  final bool showDashedVerticals;
  final Color dashedLineColor;

  // ── Tooltip ───────────────────────────────────────────────────────────────
  final bool showTooltips;
  final Color primaryTooltipBg;
  final Color primaryTooltipText;
  final Color secondaryTooltipBg;
  final Color secondaryTooltipText;

  // ── Grid & axis ───────────────────────────────────────────────────────────
  final double maxY;
  final double yInterval;
  final Color gridColor;
  final Color axisLabelColor;

  // ── Chart size ────────────────────────────────────────────────────────────
  final double chartHeight;

  const MonthlyRevenueChart({
    super.key,
    required this.year2020,
    required this.year2021,

    // Header
    this.title = "Monthly Revenue",
    this.subtitle = "Monthly revenue over full of year",
    this.subtitleColor = const Color(0xFFA3AED0),

    // Legend
    this.line1Label = "2020",
    this.line2Label = "2021",
    this.showLegend = true,

    // Line colors
    this.line1Color = Colors.black,
    this.line2Color = const Color(0xFFBDBDBD),

    // Dot highlights
    this.primaryDotIndex,
    this.secondaryDotIndex,

    // Dashed verticals
    this.showDashedVerticals = false,
    this.dashedLineColor = const Color(0xFF94A3B8),

    // Tooltips
    this.showTooltips = true,
    this.primaryTooltipBg = const Color(0xFF1E293B),
    this.primaryTooltipText = Colors.white,
    this.secondaryTooltipBg = Colors.white,
    this.secondaryTooltipText = const Color(0xFF1E293B),

    // Grid & axis
    this.maxY = 40000,
    this.yInterval = 10000,
    this.gridColor = const Color(0xFFF1F5F9),
    this.axisLabelColor = Colors.grey,

    // Chart size
    this.chartHeight = 300,
  });

  @override
  Widget build(BuildContext context) {
    final months = [
      "Jan","Feb","Mar","Apr","May","Jun",
      "Jul","Aug","Sept","Oct","Nov","Des"
    ];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.5, vertical: 36),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [

          // ── Header ────────────────────────────────────────────────
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
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontFamily: AppFonts.dmSans,
                      fontSize: 12,
                      color: subtitleColor,
                    ),
                  ),
                ],
              ),

              if (showLegend)
                Row(
                  children: [
                    _LegendDot(color: line1Color, text: line1Label),
                    const SizedBox(width: 16),
                    _LegendDot(color: line2Color, text: line2Label),
                  ],
                ),
            ],
          ),

          const SizedBox(height: 20),

          // ── Chart ─────────────────────────────────────────────────
          SizedBox(
            height: chartHeight,
            child: LineChart(
              LineChartData(
                minX: 0,
                maxX: 11,
                minY: 0,
                maxY: maxY,

                // ── Grid ──────────────────────────────────────────
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: true,
                  horizontalInterval: yInterval,
                  verticalInterval: 1,
                  getDrawingHorizontalLine: (_) => FlLine(color: gridColor, strokeWidth: 1),
                  getDrawingVerticalLine: (_) => FlLine(color: gridColor, strokeWidth: 1),
                ),

                borderData: FlBorderData(show: false),

                // ── Titles ────────────────────────────────────────
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: yInterval,
                      reservedSize: 50,
                      getTitlesWidget: (value, _) => Text(
                        "\$${(value / 1000).toInt()}k",
                        style: TextStyle(color: axisLabelColor, fontSize: 12),
                      ),
                    ),
                  ),
                  rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  topTitles:   const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: 1,
                      getTitlesWidget: (value, _) {
                        final i = value.toInt();
                        if (i < 0 || i >= months.length) return const SizedBox();
                        return Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            months[i],
                            style: TextStyle(fontSize: 12, color: axisLabelColor),
                          ),
                        );
                      },
                    ),
                  ),
                ),

                // ── Dashed verticals ──────────────────────────────
                extraLinesData: showDashedVerticals
                    ? ExtraLinesData(
                        verticalLines: [
                          if (primaryDotIndex != null)
                            VerticalLine(
                              x: primaryDotIndex!.toDouble(),
                              color: dashedLineColor,
                              strokeWidth: 1,
                              dashArray: [5, 4],
                            ),
                          if (secondaryDotIndex != null)
                            VerticalLine(
                              x: secondaryDotIndex!.toDouble(),
                              color: dashedLineColor,
                              strokeWidth: 1,
                              dashArray: [5, 4],
                            ),
                        ],
                      )
                    : ExtraLinesData(),

                // ── Tooltips ──────────────────────────────────────
                lineTouchData: LineTouchData(
                  enabled: showTooltips,
                  touchTooltipData: LineTouchTooltipData(
                    getTooltipColor: (spot) {
                      if (spot.x == primaryDotIndex) return primaryTooltipBg;
                      if (spot.x == secondaryDotIndex) return secondaryTooltipBg;
                      return secondaryTooltipBg;
                    },
                    tooltipBorder: const BorderSide(color: Color(0xFFE2E8F0)),
                    getTooltipItems: (spots) => spots.map((spot) {
                      final isPrimary = spot.x == primaryDotIndex;
                      return LineTooltipItem(
                        '\$ ${spot.y.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d)(?=(\d{3})+$)'), (m) => '${m[1]}.')},00',
                        TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: isPrimary ? primaryTooltipText : secondaryTooltipText,
                        ),
                      );
                    }).toList(),
                  ),
                ),

                // ── Lines ─────────────────────────────────────────
                lineBarsData: [
                  // Line 1
                  LineChartBarData(
                    spots: List.generate(
                      year2020.length,
                      (i) => FlSpot(i.toDouble(), year2020[i]),
                    ),
                    isCurved: true,
                    curveSmoothness: 0.35,
                    color: line1Color,
                    barWidth: 3,
                    dotData: FlDotData(
                      show: primaryDotIndex != null || secondaryDotIndex != null,
                      getDotPainter: (spot, _, __, ___) {
                        if (spot.x == primaryDotIndex) {
                          return FlDotCirclePainter(radius: 6, color: primaryTooltipBg, strokeWidth: 0, strokeColor: Colors.transparent);
                        }
                        if (spot.x == secondaryDotIndex) {
                          return FlDotCirclePainter(radius: 5, color: dashedLineColor, strokeWidth: 0, strokeColor: Colors.transparent);
                        }
                        return FlDotCirclePainter(radius: 4, color: Colors.white, strokeWidth: 1.5, strokeColor: const Color(0xFFCBD5E1));
                      },
                    ),
                  ),

                  // Line 2 — only rendered when year2021 is non-empty
                  if (year2021.isNotEmpty)
                    LineChartBarData(
                      spots: List.generate(
                        year2021.length,
                        (i) => FlSpot(i.toDouble(), year2021[i]),
                      ),
                      isCurved: true,
                      curveSmoothness: 0.35,
                      color: line2Color,
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

// ── Legend dot ───────────────────────────────────────────────────────────────
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
        Text(text, style: const TextStyle(fontSize: 12, color: Colors.grey)),
      ],
    );
  }
}