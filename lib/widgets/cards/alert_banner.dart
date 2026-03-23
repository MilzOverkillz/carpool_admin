import 'package:flutter/material.dart';
import '../../utils/theme/colors.dart';
import '../../utils/theme/text_styles.dart'; 

class AlertBannerWidget extends StatelessWidget {
  const AlertBannerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: AppColors.surface, // White background
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: const Color(0xFFE5E7EB), 
          width: 1.0,
        ),
        // --- SHARP 3D SHADOW (Darker!) ---
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.20), // Made it darker here! (was a light gray before)
            blurRadius: 0,            // 0 blur keeps it sharp
            spreadRadius: 0,          
            offset: const Offset(3, 3), // Drops it 3px Right, 3px Down
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/icons/error_icon.png',
            width: 17,
            height: 17,
            color: const Color(0xFF1E272E), 
          ),
          const SizedBox(width: 8),
          Text(
            '1 ride flagged for review',
            style: AppTextStyles.pageHeaderSubtitle.copyWith(
              fontWeight: FontWeight.w700, 
              color: const Color(0xFF1E272E), 
            ),
          ),
        ],
      ),
    );
  }
}