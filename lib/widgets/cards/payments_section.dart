import 'package:flutter/material.dart';
import '../../utils/theme/colors.dart';
import '../../utils/theme/text_styles.dart';

class PaymentsSection extends StatelessWidget {
  const PaymentsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final topHeaderStyle = AppTextStyles.pageHeaderSubtitle.copyWith(
      fontWeight: FontWeight.w700, 
      color: AppColors.black,
    );

    final topValueStyle = AppTextStyles.searchInputText.copyWith(
      fontWeight: FontWeight.w700,
      color: AppColors.black,
    );

    return OverflowBox(
      maxWidth: 500,
      alignment: Alignment.topLeft,
      child: Transform.translate(
        // Aligns with the Participants section offset to sit perfectly under the tabs
        offset: const Offset(-14, -4),
        child: Container(
          width: 479,  // EXACT Figma Width
          height: 306, // EXACT Figma Height
          padding: const EdgeInsets.all(20), // Inner padding for the white box
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(13), // EXACT Figma Radius
            border: Border.all(color: const Color(0xFFD9D7D7), width: 1), // EXACT Figma Border
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- 1. Top Row (Total Fare & Payment Status Cards) ---
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Left Card: Total Fare
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.tagPillBg, width: 1), 
                      borderRadius: BorderRadius.circular(10), 
                    ),
                    child: Row(
                      children: [
                        // Dollar Icon Circle
                        Container(
                          width: 25,
                          height: 25,
                          decoration: const BoxDecoration(
                            color: AppColors.tabsSelection, 
                            shape: BoxShape.circle,
                          ),
                          alignment: Alignment.center,
                          child: Image.asset(
                            'assets/icons/dollar.png', // Replace with your asset
                            width: 14, 
                            height: 14,
                            color: AppColors.black, 
                          ),
                        ),
                        const SizedBox(width: 12),
                        
                        // Total Fare Text
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Total Fare', style: topHeaderStyle),
                            Text('\$ 24.50', style: topValueStyle),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // Spacing between the two cards
                  const SizedBox(width: 24), 

                  // Right Card: Payment Status
                  Container(
                    height: 38, 
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.tagPillBg, width: 1), 
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Payment Status', style: topHeaderStyle),
                        const SizedBox(width: 10), 
                        _buildMiniPill('Paid'),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 18), // Gap before the details box

              // --- 2. The Details Info Box ---
              // Wrapping in Expanded so it fills the remaining space of the 306px box without overflowing
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16), 
                  decoration: BoxDecoration(
                    color: AppColors.surfaceSecondary, // #F6F8FA
                    borderRadius: BorderRadius.circular(12), 
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween, // Distributes rows evenly
                    children: [
                      _buildInfoRow('Date and Time', 'Dec 13, 2024 | 8:50 A.M'),
                      _buildInfoRow('Base Fare', '\$ 15.00'),
                      _buildInfoRow('Distance', '\$ 8.00'),
                      _buildInfoRow('Service Fee', '\$ 1.50'),
                      
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: _buildDashedLine(),
                      ), 
                      
                      _buildInfoRow('Total', '\$ 24.50'),
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

  // --- Helper 1: Status Pill ---
  Widget _buildMiniPill(String text) {
    return Container(
      height: 22, 
      padding: const EdgeInsets.symmetric(horizontal: 12), 
      decoration: BoxDecoration(
        color: AppColors.tagPillBg, 
        borderRadius: BorderRadius.circular(10), 
      ),
      alignment: Alignment.center,
      child: Text(
        text,
        style: AppTextStyles.sidebarProfileEmail.copyWith(
          color: AppColors.black, 
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
            color: AppColors.textSecondary, 
          ),
        ),
        Text(
          value,
          style: AppTextStyles.bodyMedium.copyWith(
            fontWeight: FontWeight.w700, 
            color: AppColors.textPrimary, 
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
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: AppColors.border), 
              ),
            );
          }),
        );
      },
    );
  }
}