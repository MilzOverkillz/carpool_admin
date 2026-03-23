import 'package:flutter/material.dart';
import '../../utils/theme/text_styles.dart';

class RouteSection extends StatelessWidget {
  const RouteSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final locationNameStyle = AppTextStyles.bodyMedium.copyWith(
      fontWeight: FontWeight.w600, 
      color: const Color(0xFF1E272E),
      height: 1.43,
    );

    final locationTimeStyle = AppTextStyles.bodySmall.copyWith(
      fontWeight: FontWeight.w600, 
      fontSize: 12, 
      color: const Color(0xFF1E272E),
      height: 1.5,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // --- 1. Header ---
        const Text(
          'Route Details',
          style: AppTextStyles.pageHeaderTitle, 
        ),
        
        const SizedBox(height: 16), 

        // --- 2. Location List with Dotted Connector ---
        Padding(
          padding: const EdgeInsets.only(left: 21.0),
          child: SizedBox(
            width: 326, 
            height: 58.83, 
            child: Stack(
              children: [
                // Vertical Dotted Line
                Positioned(
                  left: 2.65, 
                  top: 10, 
                  bottom: 10, 
                  child: CustomPaint(
                    painter: DottedLinePainter(
                      color: const Color(0xFFC7C9CB),
                      dashWidth: 4,
                      dashGap: 4,
                    ),
                  ),
                ),
                
                // Nodes (dots and text)
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween, 
                  children: [
                    _buildLocationNode(
                      dotSize: 6.3,
                      dotColor: const Color(0xFF1E272E),
                      borderColor: const Color(0xFFF9FAFB),
                      location: 'Tangelle Bust stop',
                      time: '9.20 AM',
                      nameStyle: locationNameStyle,
                      timeStyle: locationTimeStyle,
                    ),
                    
                    _buildLocationNode(
                      dotSize: 6.3,
                      dotColor: const Color(0xFF1E272E),
                      borderColor: const Color(0xFFF9FAFB),
                      location: 'KnightOwl',
                      time: '9.50 AM',
                      nameStyle: locationNameStyle,
                      timeStyle: locationTimeStyle,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 24), 

        // --- 3. Map Placeholder (FIXED!) ---
        Container(
          width: 476, 
          height: 173, 
          decoration: BoxDecoration(
            color: const Color(0xFFC7C9CB), 
            borderRadius: BorderRadius.circular(18), 
            border: Border.all(color: const Color(0xFFC7C9CB), width: 1), 
          ),
          // Wrap the image in a ClipRRect to match the container's rounded corners!
          child: ClipRRect(
            borderRadius: BorderRadius.circular(17), // 17px to sit perfectly inside the 1px border
            child: Image.asset(
              'assets/images/map.png', 
              width: double.infinity, // Tell it to stretch fully
              height: double.infinity,
              fit: BoxFit.cover, // Tell it to crop gracefully instead of shrinking!
            ),
          ),
        ),
      ],
    );
  }

  // --- Helper 1: Build a single location node ---
  Widget _buildLocationNode({
    required double dotSize,
    required Color dotColor,
    required Color borderColor,
    required String location,
    required String time,
    required TextStyle nameStyle,
    required TextStyle timeStyle,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center, 
      children: [
        Container(
          width: dotSize,
          height: dotSize,
          decoration: BoxDecoration(
            color: dotColor,
            shape: BoxShape.circle,
            border: Border.all(color: borderColor, width: 1),
          ),
        ),
        
        const SizedBox(width: 16), 

        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(location, style: nameStyle),
              Text(time, style: timeStyle),
            ],
          ),
        ),
      ],
    );
  }
}

// --- Helper 2: Custom painter to draw the vertical dotted line ---
class DottedLinePainter extends CustomPainter {
  final Color color;
  final double dashWidth;
  final double dashGap;
  DottedLinePainter({this.color = Colors.grey, this.dashWidth = 4, this.dashGap = 4});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = color
      ..strokeWidth = 1 
      ..style = PaintingStyle.stroke;

    var maxExtent = size.height;
    var startY = 0.0;
    while (startY < maxExtent) {
      canvas.drawLine(Offset(0, startY), Offset(0, startY + dashWidth), paint);
      startY += dashWidth + dashGap;
    }
  }

  @override
  bool shouldRepaint(DottedLinePainter oldDelegate) => false;
}