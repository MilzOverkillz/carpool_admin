import 'package:flutter/material.dart';
import '../../utils/theme/fonts.dart';
import '../../utils/theme/text_styles.dart';

class ParticipantsSection extends StatelessWidget {
  const ParticipantsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OverflowBox(
      maxWidth: 500, 
      alignment: Alignment.topLeft,
      child: Transform.translate(
        offset: const Offset(-14, -4), 
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDriverCard(),
            
            const SizedBox(height: 12), // Gap between Driver and Riders cards
            
            _buildRidersCard(),
          ],
        ),
      ),
    );
  }

  // --- 1. Driver Card ---
  Widget _buildDriverCard() {
    return Container(
      width: 479, 
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14), 
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(13), 
        border: Border.all(color: const Color(0xFFD9D7D7), width: 1), 
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(
                'assets/icons/driver_icon.png', 
                width: 21,
                height: 21,
                color: const Color(0xFF1E272E),
              ),
              const SizedBox(width: 8),
              Text(
                'Driver',
                style: AppTextStyles.bodyMedium.copyWith(
                  fontFamily: AppFonts.primary, 
                  fontWeight: FontWeight.w700, 
                  fontSize: 14,
                  color: const Color(0xFF1E272E),
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 12), 
          
          _buildPersonRow(
            initials: 'JS',
            name: 'John Smith',
            email: 'johnsmith@techcorp.com',
            rating: '4.8',
            isDriver: true, 
          ),
        ],
      ),
    );
  }

  // --- 2. Riders Card ---
  Widget _buildRidersCard() {
    return Container(
      width: 479, 
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14), 
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(13), 
        border: Border.all(color: const Color(0xFFD9D7D7), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(
                'assets/icons/riders_icon.png', 
                width: 21,
                height: 21,
                color: const Color(0xFF1E272E),
              ),
              const SizedBox(width: 8),
              Text(
                'Riders (4)',
                style: AppTextStyles.bodyMedium.copyWith(
                  fontFamily: AppFonts.primary,
                  fontWeight: FontWeight.w700, 
                  fontSize: 14,
                  color: const Color(0xFF1E272E),
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 16), // Gap between header and grid

          // --- THE FIX IS HERE ---
          Wrap(
            spacing: 36, // Increased horizontal gap between the two columns
            runSpacing: 20, // Increased vertical gap between the top and bottom rows
            children: List.generate(4, (index) {
              return SizedBox(
                width: 180, // Slightly reduced width to make room for the larger horizontal spacing
                child: _buildPersonRow(
                  initials: 'JS',
                  name: 'John Smith',
                  email: 'johnsmith@techcorp.com',
                  rating: '4.8',
                  isDriver: false,
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  // --- Helper: Reusable Person Profile Row ---
  Widget _buildPersonRow({
    required String initials,
    required String name,
    required String email,
    required String rating,
    required bool isDriver, 
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            color: const Color(0xFF74797D),
            borderRadius: BorderRadius.circular(10), 
          ),
          alignment: Alignment.center,
          child: Text(
            initials,
            style: const TextStyle(
              fontFamily: AppFonts.primary,
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        
        const SizedBox(width: 12), 

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Line 1: Name 
              Row(
                children: [
                  Text(
                    name,
                    style: AppTextStyles.bodyMedium.copyWith(
                      fontFamily: AppFonts.primary, 
                      fontWeight: FontWeight.w700, 
                      fontSize: 14,
                      color: const Color(0xFF1E272E),
                      height: 1.2, 
                    ),
                  ),
                  
                  if (isDriver) ...[
                    const SizedBox(width: 6),
                    const Icon(Icons.star, size: 13, color: Color(0xFF1E272E)),
                    const SizedBox(width: 4),
                    Text(
                      rating,
                      style: AppTextStyles.pageHeaderSubtitle.copyWith(
                        fontFamily: 'DMSans',
                        fontSize: 12,
                        color: const Color(0xFFC7C9CB),
                        letterSpacing: -0.24,
                      ),
                    ),
                  ],
                ],
              ),
              
              // Line 2: Email
              Text(
                email,
                style: AppTextStyles.pageHeaderSubtitle.copyWith(
                  fontFamily: 'DMSans',
                  fontSize: 12,
                  color: const Color(0xFF9EA2A5), 
                  letterSpacing: -0.24,
                  height: 1.2, 
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis, 
              ),
              
              // Line 3: Rating (Riders only)
              if (!isDriver) ...[
                const SizedBox(height: 4), 
                Row(
                  children: [
                    const Icon(Icons.star, size: 13, color: Color(0xFF1E272E)),
                    const SizedBox(width: 4),
                    Text(
                      rating,
                      style: AppTextStyles.pageHeaderSubtitle.copyWith(
                        fontFamily: 'DMSans',
                        fontSize: 12,
                        color: const Color(0xFFC7C9CB),
                        letterSpacing: -0.24,
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}