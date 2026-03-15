import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../utils/theme/colors.dart';
import '../../utils/theme/text_styles.dart'; 

class TopBarWidget extends StatelessWidget {
  final String title;

  const TopBarWidget({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Dynamic Page Title
          Text(
            title,
            style: AppTextStyles.topBarTitle, 
          ),

          // Right Side: Search and Icons
          Container(
            padding: EdgeInsets.symmetric(horizontal: 9.03),
            width: 381.23,
        height: 61,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color:Colors.white),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildSearchBar(),
                // Notifications Icon
                _buildCustomIcon(
                  assetPath: 'assets/icons/dashboard/notifications.svg', 
                  width: 21.68,
                  height: 24.0,
                ),
                
                // Moon (Dark Mode) Icon
                _buildCustomIcon(
                  assetPath: 'assets/icons/dashboard/moon.svg', 
                  width: 16.26,
                  height: 18.0,
                ),
                
                // Info Icon
                _buildCustomIcon(
                  assetPath: 'assets/icons/dashboard/info.svg', 
                  width: 21.68,
                  height: 24.0,
                ),
                
                // User Avatar
                _buildAvatar(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // --- Helper: Search Bar ---
  Widget _buildSearchBar() {
    return Container(
      width: 193.33, 
      height: 41,
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      decoration: BoxDecoration(
        color: AppColors.surface, 
        borderRadius: BorderRadius.circular(24.0), 
        boxShadow: const [
          BoxShadow(
            color: Color(0x05000000), 
            blurRadius: 10,
            offset: Offset(0, 2),
          )
        ],
      ),
      child: Row(
        children: [
          // Custom Search Icon
          Image.asset(
            'assets/icons/dashboard/search.png', 
            width: 10.0, 
            height: 10.0, 
            color: const Color(0xFF495056), 
          ),
          const SizedBox(width: 12),
          Expanded(
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Search',
                border: InputBorder.none,
                isDense: true,
                contentPadding: EdgeInsets.zero,
                hintStyle: AppTextStyles.searchHintText, 
              ),
              style: AppTextStyles.searchInputText, 
            ),
          ),
        ],
      ),
    );
  }

  // --- Helper: Action Icons (Using custom assets) ---
  Widget _buildCustomIcon({
    required String assetPath,
    required double width,
    required double height,
  }) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(20),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SvgPicture.asset(
          assetPath,
          width: width,   
          height: height, 
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  // --- Helper: User Avatar ---
  Widget _buildAvatar() {
    return Container(
      width: 37.04, 
      height: 41.0, 
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage('assets/icons/dashboard/avatar_placeholder.png'), 
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}