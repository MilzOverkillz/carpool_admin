import 'package:flutter/material.dart';
import '../../utils/theme/colors.dart';
import '../../utils/theme/fonts.dart';
import '../../utils/theme/text_styles.dart';

class RatingsSection extends StatelessWidget {
  const RatingsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Using the same OverflowBox and Transform trick from ParticipantsSection
    // to perfectly align the 479px wide cards to the 20px absolute left margin!
    return OverflowBox(
      maxWidth: 500,
      alignment: Alignment.topLeft,
      child: Transform.translate(
        offset: const Offset(-14, -4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildRatingCard(
              iconPath: 'assets/icons/driver_icon.png', // Replace with your actual driver icon
              title: 'Driver Rating',
              subtitle: 'Rating given by rider',
              ratingValue: 4.0,
              reviewText: '"Great driver, very professional and on time!"',
            ),
            
            const SizedBox(height: 16), // Gap between the two rating cards
            
            _buildRatingCard(
              iconPath: 'assets/icons/riders_icon.png', // Replace with your actual riders icon
              title: 'Rider Rating',
              subtitle: 'Rating given by driver',
              ratingValue: 4.0,
              reviewText: '"Friendly riders, ready on time."',
            ),
          ],
        ),
      ),
    );
  }

  // --- Helper: Reusable Rating Card ---
  Widget _buildRatingCard({
    required String iconPath,
    required String title,
    required String subtitle,
    required double ratingValue,
    required String reviewText,
  }) {
    return Container(
      width: 479, // EXACT Figma Width
      height: 116, // EXACT Figma Height
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14), 
      decoration: BoxDecoration(
        color: AppColors.surface, // White
        borderRadius: BorderRadius.circular(13), // 13px Radius
        border: Border.all(color: const Color(0xFFD9D7D7), width: 1), // Exact Border
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // --- 1. Header Row (Icon + Title) ---
          Row(
            children: [
              Image.asset(
                iconPath,
                width: 21,
                height: 21,
                color: AppColors.textPrimary,
              ),
              const SizedBox(width: 8),
              Text(
                title,
                style: AppTextStyles.bodyMedium.copyWith(
                  fontFamily: AppFonts.primary,
                  fontWeight: FontWeight.w700, // Bold
                  fontSize: 14,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 2),

          // --- 2. Subtitle ---
          Text(
            subtitle,
            style: AppTextStyles.pageHeaderSubtitle.copyWith(
              fontFamily: AppFonts.primary, // Reverting DM Sans back to Inter for consistency
              fontSize: 12,
              color: AppColors.textHint, // #9CA3AF
              height: 1.2,
            ),
          ),
          
          const SizedBox(height: 8),

          // --- 3. Stars & Rating Value ---
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Generate 5 stars based on the rating value
              ...List.generate(5, (index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 4.0),
                  child: Image.asset(
                    'assets/icons/star.png', // EXACT Figma Request
                    width: 18, // EXACT Figma Size
                    height: 18,
                    // Tint the star yellow if it's filled, or light grey if empty
                    color: index < ratingValue.floor() 
                        ? AppColors.warning // #F59E0B (Yellow/Amber)
                        : AppColors.divider, // #E5E7EB (Light Grey)
                  ),
                );
              }),
              
              const SizedBox(width: 4),
              
              Text(
                ratingValue.toStringAsFixed(1), // Formats 4 to "4.0"
                style: AppTextStyles.bodyMedium.copyWith(
                  fontWeight: FontWeight.w700, // Bold
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),

          const Spacer(), // Pushes the review text to the bottom of the card

          // --- 4. Review Text ---
          Text(
            reviewText,
            // EXACT Figma Specs: Inter, Medium (500), 12px
            style: AppTextStyles.caption.copyWith(
              fontWeight: FontWeight.w500, // Medium
              color: const Color(0xFF1E272E),
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}