import 'package:flutter/material.dart';
import '../../utils/theme/colors.dart';
import '../../utils/theme/fonts.dart';
import '../../utils/theme/text_styles.dart';

class UserCardWidget extends StatelessWidget {
  final String name;
  final String email;
  final String company;
  final String role;
  final String rides;
  final String rating;
  final String status;
  
  final String initials;
  final String? profileImageName; 

  const UserCardWidget({
    Key? key,
    required this.name,
    required this.email,
    required this.company,
    required this.role,
    required this.rides,
    required this.rating,
    required this.status,
    required this.initials,
    this.profileImageName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.divider)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // 1. User Info (Flex: 3, Left)
          Expanded(
            flex: 3,
            child: Row(
              children: [
                _buildAvatar(), 
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        name, 
                        style: AppTextStyles.bodyMedium.copyWith(
                          fontWeight: FontWeight.w600, 
                          color: AppColors.textPrimary, 
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        email, 
                        style: AppTextStyles.caption.copyWith(
                          color: AppColors.textHint, 
                          fontSize: 11,
                        ), 
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          
          // 2. Company (Flex: 2, Left)
          Expanded(
            flex: 2,
            child: Text(
              company, 
              style: AppTextStyles.bodySmall.copyWith(
                fontWeight: FontWeight.w500, 
                color: AppColors.textSecondary,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          
          // 3. Role Pill (Flex: 2, Center aligned)
          Expanded(
            flex: 2,
            child: Align(
              alignment: Alignment.center,
              child: _buildPill(role), 
            ),
          ),
          
          // 4. Total Rides (Flex: 1, Center)
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.center,
              child: Text(
                rides, 
                style: AppTextStyles.bodySmall.copyWith(
                  fontWeight: FontWeight.w500, 
                  color: AppColors.textSecondary,
                ),
              ),
            ),
          ),
          
          // 5. Rating (Flex: 1, Center)
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (rating != 'N/A') const Icon(Icons.star, size: 14, color: AppColors.textPrimary),
                if (rating != 'N/A') const SizedBox(width: 4),
                Text(
                  rating, 
                  style: AppTextStyles.bodySmall.copyWith(
                    fontWeight: FontWeight.w500, 
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          
          // 6. Status Pill (Flex: 1, Center)
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.center,
              child: _buildPill(status), 
            ),
          ),
          
          // 7. Actions Dropdown Button (Flex: 1, Center)
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.center,
              child: InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(10), 
                child: Container(
                  width: 89, 
                  height: 26, 
                  padding: const EdgeInsets.symmetric(horizontal: 15), 
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.filterBorder, width: 1.0), 
                    borderRadius: BorderRadius.circular(10), 
                    color: AppColors.surface, 
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Action', 
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF6B7280), // Action text
                        ),
                      ),
                      const SizedBox(width: 5), 
                      Image.asset(
                        'assets/icons/chevron_down.png', 
                        width: 10, 
                        height: 10,
                        color: const Color(0xFF6B7280), 
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAvatar() {
    if (profileImageName != null && profileImageName!.isNotEmpty) {
      return Container(
        width: 30, // EXACTLY 30px
        height: 30, // EXACTLY 30px
        decoration: BoxDecoration(
          color: AppColors.textSecondary, 
          borderRadius: BorderRadius.circular(10), // EXACTLY 10px radius
          image: DecorationImage(
            image: AssetImage('assets/icons/$profileImageName'), 
            fit: BoxFit.cover,
          ),
        ),
      );
    } 
    
    return Container(
      width: 30, // EXACTLY 30px
      height: 30, // EXACTLY 30px
      decoration: BoxDecoration(
        color: AppColors.textSecondary, 
        borderRadius: BorderRadius.circular(10), // EXACTLY 10px radius
      ),
      child: Center(
        child: Text(
          initials,
          style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  Widget _buildPill(String text) {
    return Container(
      height: 24, 
      padding: const EdgeInsets.symmetric(horizontal: 12), 
      decoration: BoxDecoration(
        color: AppColors.barFillGrey, // Using standard pill background from theme
        borderRadius: BorderRadius.circular(10), 
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min, // Hugs content dynamically
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            text,
            style: const TextStyle(
              fontFamily: AppFonts.primary, 
              fontSize: 10, // Updated to 10px from Figma
              fontWeight: FontWeight.w400, // Updated to Regular (400) from Figma
              color: Color(0xFF1E272E), // Updated to #1E272E Black-Text from Figma
            ),
          ),
        ],
      ),
    );
  }
}