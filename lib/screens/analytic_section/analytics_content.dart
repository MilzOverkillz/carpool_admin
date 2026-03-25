import 'package:flutter/material.dart';

class AnalyticsContent extends StatelessWidget {
  const AnalyticsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(left: 15, right: 180, bottom: 32, top: 0),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 1600),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              color: Color(0x0A000000),
              blurRadius: 12,
              offset: Offset(0, 2),
            ),
          ],
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Top Stat Cards ──
            Row(
              children: [
                _buildStatCard('Total Drivers', '1284'),
                const SizedBox(width: 14),
                _buildStatCard('Total Riders', '34'),
                const SizedBox(width: 14),
                _buildStatCard('Total Earnings', '\$1,284'),
              ],
            ),

            const SizedBox(height: 20),

            // ── Company Analytics Title ──
            const Text(
              'Company Analytics',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Color(0xFF111827),
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'Detailed insights for your organisation',
              style: TextStyle(fontSize: 11, color: Color(0xFF9CA3AF)),
            ),

            const SizedBox(height: 14),

            // ── Chart ──
            _buildChartCard(),

            const SizedBox(height: 14),

            // ── Bottom Row ──
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 5, child: _buildPopularRoutes()),
                const SizedBox(width: 14),
                Expanded(flex: 4, child: _buildPeakTimes()),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // ── Stat Card ─────────────────────────────────────────────────────────────

  Widget _buildStatCard(String title, String value) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.fromLTRB(14, 12, 14, 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: const Color.fromARGB(255, 0, 0, 0),
            width: 0.5,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              value,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: Color(0xFF111827),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ── Chart Card ────────────────────────────────────────────────────────────

  Widget _buildChartCard() {
    return Container(
      constraints: const BoxConstraints(
        maxWidth: 500,
      ), // ✅ only chart is limited

      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: const Color.fromARGB(255, 0, 0, 0),
          width: 0.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                'Over the 7 month',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              const Spacer(),
              _legendDot(const Color.fromARGB(255, 0, 0, 0), 'Cost'),
              const SizedBox(width: 12),
              _legendDot(const Color(0xFFD1D5DB), 'Rides'),
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 160,
            child: CustomPaint(painter: _ChartPainter(), size: Size.infinite),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: ['Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
                .map(
                  (m) => Text(
                    m,
                    style: const TextStyle(
                      fontSize: 10,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget _legendDot(Color color, String label) {
    return Row(
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 4),
        Text(
          label,
          style: const TextStyle(fontSize: 11, color: Color(0xFF6B7280)),
        ),
      ],
    );
  }

  // ── Popular Routes ─────────────────────────────────────────────────────────

  Widget _buildPopularRoutes() {
    final routes = [
      ('Galle', 'KnightOwl', '87 Rides'),
      ('Matara', 'Healthcare Pvt', '87 Rides'),
      ('Tangalle', 'Galle', '87 Rides'),
      ('Matara', 'KnightOwl', '87 Rides'),
    ];

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: const Color.fromARGB(255, 0, 0, 0),
          width: 0.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Popular Routes',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
          const SizedBox(height: 14),
          ...routes.map(
            (r) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                children: [
                  Text(
                    r.$1,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6),
                    child: Icon(
                      Icons.arrow_forward,
                      size: 12,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                  Text(
                    r.$2,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    r.$3,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ── Peak Times ─────────────────────────────────────────────────────────────

  Widget _buildPeakTimes() {
    final times = [
      ('Morning (8-9 AM )', '45%'),
      ('Evening (5-6 AM )', '45%'),
      ('Afternoon (12-2 PM )', '45%'),
    ];

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: const Color.fromARGB(255, 0, 0, 0),
          width: 0.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Peak Times',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
          const SizedBox(height: 14),
          ...times.map(
            (t) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                children: [
                  Text(
                    t.$1,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    t.$2,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
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

// ── Chart Painter ─────────────────────────────────────────────────────────────

class _ChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    final labelStyle = const TextStyle(fontSize: 9, color: Color(0xFF9CA3AF));

    void drawLeftLabel(String text, double y) {
      final tp = TextPainter(
        text: TextSpan(text: text, style: labelStyle),
        textDirection: TextDirection.ltr,
      )..layout();
      tp.paint(canvas, Offset(0, y - tp.height / 2));
    }

    void drawRightLabel(String text, double y) {
      final tp = TextPainter(
        text: TextSpan(text: text, style: labelStyle),
        textDirection: TextDirection.ltr,
      )..layout();
      tp.paint(canvas, Offset(w - tp.width, y - tp.height / 2));
    }

    final leftLabels = ['0', '20', '40', '60', '80', '100'];
    final rightLabels = ['0', '500', '1000', '1500', '2000', '2500'];
    for (int i = 0; i < leftLabels.length; i++) {
      final y = h - (i / (leftLabels.length - 1)) * h;
      drawLeftLabel(leftLabels[i], y);
      drawRightLabel(rightLabels[i], y);
    }

    final chartLeft = 28.0;
    final chartRight = w - 32.0;
    final chartW = chartRight - chartLeft;

    final gridPaint = Paint()
      ..color = const Color(0xFFF3F4F6)
      ..strokeWidth = 0.8;
    for (int i = 0; i < leftLabels.length; i++) {
      final y = h - (i / (leftLabels.length - 1)) * h;
      canvas.drawLine(Offset(chartLeft, y), Offset(chartRight, y), gridPaint);
    }

    List<Offset> toPoints(List<double> values, double maxVal) {
      final n = values.length;
      return List.generate(n, (i) {
        final x = chartLeft + (i / (n - 1)) * chartW;
        final y = h - (values[i] / maxVal) * h;
        return Offset(x, y);
      });
    }

    Path smoothPath(List<Offset> pts) {
      final path = Path();
      path.moveTo(pts[0].dx, pts[0].dy);
      for (int i = 0; i < pts.length - 1; i++) {
        final cp1 = Offset((pts[i].dx + pts[i + 1].dx) / 2, pts[i].dy);
        final cp2 = Offset((pts[i].dx + pts[i + 1].dx) / 2, pts[i + 1].dy);
        path.cubicTo(
          cp1.dx,
          cp1.dy,
          cp2.dx,
          cp2.dy,
          pts[i + 1].dx,
          pts[i + 1].dy,
        );
      }
      return path;
    }

    final costValues = [20.0, 60.0, 25.0, 80.0, 20.0, 55.0];
    final costPts = toPoints(costValues, 100);
    canvas.drawPath(
      smoothPath(costPts),
      Paint()
        ..color = const Color(0xFF1F2937)
        ..strokeWidth = 2.2
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round,
    );

    final ridesValues = [30.0, 75.0, 20.0, 80.0, 40.0, 20.0];
    final ridesPts = toPoints(ridesValues, 100);
    canvas.drawPath(
      smoothPath(ridesPts),
      Paint()
        ..color = const Color(0xFFD1D5DB)
        ..strokeWidth = 2.2
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round,
    );

    // Dot on Oct (index 3)
    final dotPt = costPts[3];
    canvas.drawCircle(dotPt, 5, Paint()..color = const Color(0xFF1F2937));
    canvas.drawCircle(dotPt, 3, Paint()..color = Colors.white);

    // Tooltip
    final tooltipX = dotPt.dx - 36;
    final tooltipY = dotPt.dy + 10;
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(tooltipX, tooltipY, 72, 28),
        const Radius.circular(6),
      ),
      Paint()..color = const Color(0xFF1F2937),
    );

    final ttStyle = const TextStyle(
      fontSize: 8,
      color: Colors.white,
      fontWeight: FontWeight.w500,
    );

    void drawTT(String text, double dy) {
      final tp = TextPainter(
        text: TextSpan(text: text, style: ttStyle),
        textDirection: TextDirection.ltr,
      )..layout();
      tp.paint(canvas, Offset(tooltipX + 6, dy));
    }

    drawTT('\$ 38,753.00', tooltipY + 4);
    drawTT('Rides : 48', tooltipY + 15);
  }

  @override
  bool shouldRepaint(_ChartPainter old) => false;
}
