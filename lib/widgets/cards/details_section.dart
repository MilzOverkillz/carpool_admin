import 'package:flutter/material.dart';
import '../../utils/theme/text_styles.dart'; 

class DetailsSection extends StatelessWidget {
  final String rideStatus;
  final String paymentStatus;

  const DetailsSection({
    Key? key,
    required this.rideStatus,
    required this.paymentStatus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Label Style for Status Headers: Inter, 600, 12px, #262626
    final statusHeaderStyle = AppTextStyles.tableHeader.copyWith(
      color: const Color(0xFF262626),
      fontWeight: FontWeight.w700,
      letterSpacing: 0,
      height: 1.2,
    );

    return Column(
      children: [
        // --- 1. Top Status Row ---
        Row(
          children: [
            Text('Ride Status', style: statusHeaderStyle),
            const SizedBox(width: 12),
            _buildMiniPill(rideStatus),

            const SizedBox(width: 72),

            Text('Payment Status', style: statusHeaderStyle),
            const SizedBox(width: 10),
            _buildMiniPill(paymentStatus),
          ],
        ),

        const SizedBox(height: 20),

        // --- 2. The Details Info Box ---
        Container(
          padding: const EdgeInsets.all(20), 
          decoration: BoxDecoration(
            color: const Color(0xFFF6F8FA), 
            borderRadius: BorderRadius.circular(12), 
          ),
          child: Column(
            children: [
              _buildInfoRow('Date and Time', 'Dec 13, 2024 | 8:50 A.M'),
              const SizedBox(height: 16),
              
              _buildInfoRow('Company', '400LKR'),
              const SizedBox(height: 16),
              
              _buildInfoRow('No of riders', '02'),
              const SizedBox(height: 16),
              
              _buildInfoRow('Distance', '20 LKR'),
              const SizedBox(height: 16),
              
              _buildDashedLine(), 
              const SizedBox(height: 16),
              
              _buildInfoRow('Fare', '50 LKR'),
            ],
          ),
        ),
        
        // Gap between the info box and the bottom buttons
        const SizedBox(height: 24), 

        // --- 3. Action Buttons (Review & Handle Dispute) ---
        Row(
          mainAxisAlignment: MainAxisAlignment.end, // Aligns buttons to the right
          children: [
            _buildActionButton(
              iconPath: 'assets/icons/flag.png', // Update with your actual flag icon name
              label: 'Review',
              hPadding: 13.0, // Specific Figma horizontal padding
            ),
            const SizedBox(width: 12), // Gap between the two buttons
            _buildActionButton(
              iconPath: 'assets/icons/comment.png', // Update with your actual comment icon name
              label: 'Handle Dispute',
              hPadding: 9.0, // Specific Figma horizontal padding
            ),
          ],
        ),
      ],
    );
  }

  // --- Helper 1: Status Pill ---
  Widget _buildMiniPill(String text) {
    return Container(
      height: 17, 
      padding: const EdgeInsets.symmetric(horizontal: 10), 
      decoration: BoxDecoration(
        color: const Color(0xFF737373), 
        borderRadius: BorderRadius.circular(19), 
      ),
      alignment: Alignment.center,
      child: Text(
        text,
        style: AppTextStyles.sidebarProfileEmail.copyWith(
          color: Colors.white,
          height: 1.5, 
        ),
      ),
    );
  }

  // --- Helper 2: Key/Value Info Row ---
  Widget _buildInfoRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: AppTextStyles.bodyMedium.copyWith(
            fontWeight: FontWeight.w600,
            color: const Color(0xFF495056), 
          ),
        ),
        Text(
          value,
          style: AppTextStyles.bodyMedium.copyWith(
            fontWeight: FontWeight.w700, 
            color: const Color(0xFF1E272E),
          ),
        ),
      ],
    );
  }

  // --- Helper 3: Custom Dashed Line Divider ---
  Widget _buildDashedLine() {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        const dashWidth = 4.0; 
        const dashHeight = 1.0; 
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        
        return Flex(
          direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(dashCount, (_) {
            return const SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: Color(0xFFD3D8DB)), 
              ),
            );
          }),
        );
      },
    );
  }

  // --- Helper 4: Outlined Action Button ---
  Widget _buildActionButton({
    required String iconPath,
    required String label,
    required double hPadding,
  }) {
    return InkWell(
      onTap: () {
        // Add your button action here later!
      },
      borderRadius: BorderRadius.circular(12),
      child: Container(
        height: 36, // EXACT Figma height
        padding: EdgeInsets.symmetric(horizontal: hPadding, vertical: 6.0),
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFF9EA2A5), width: 1), // 1px border
          borderRadius: BorderRadius.circular(12), // 12px radius
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min, // Hugs content
          children: [
            Image.asset(
              iconPath,
              width: 24, // EXACT Figma icon size
              height: 24,
              color: Colors.black, // Ensures the icon is black
            ),
            const SizedBox(width: 10), // Gap between icon and text
            Text(
              label,
              // Figma Specs: Inter, Regular (400), 12px, #000000
              style: AppTextStyles.bodySmall.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}