import 'package:flutter/material.dart';
import '../../utils/theme/colors.dart';
import '../../utils/theme/text_styles.dart';

// Ensure this path points to your actual dropdown widget
import '../dropdowns/company_dropdown.dart'; 

class UserFilterBar extends StatelessWidget {
  const UserFilterBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      // FIX 1: Replaced Row with Wrap to allow items to flow to the next line on small screens
      child: Wrap(
        spacing: 28.0, // Horizontal gap between items
        runSpacing: 16.0, // Vertical gap when items wrap to a new line
        crossAxisAlignment: WrapCrossAlignment.center, // Vertically center search bar and dropdowns
        children: [
          _buildSearchFilter(),
          
          // Note: Spacer() removed because Wrap doesn't support Spacer
          
          const CompanyDropdownFilter(
            hint: 'All Roles', 
            width: 106.0,
            items: ['All Roles', 'Company Admin', 'Admin', 'Driver', 'Rider', 'Driver & Rider'],
          ),
          
          const CompanyDropdownFilter(
            hint: 'All Companies', 
            width: 132.0,
            items: ['All Companies', 'Tech corp Inc', 'Design Studio Ltd', 'Finance solutions', 'Healthcare Pvt', 'Retail Group'],
          ),
          
          const CompanyDropdownFilter(
            hint: 'All Status', 
            width: 106.0,
            items: ['All Status', 'Active', 'Inactive', 'Suspend', 'Banned'],
          ),
        ],
      ),
    );
  }

  // --- Sub-widget: Filter Search Box ---
  Widget _buildSearchFilter() {
    return Container(
      // Gave the search filter a constraints so it shrinks slightly if needed
      constraints: const BoxConstraints(maxWidth: 469),
      height: 47,
      padding: const EdgeInsets.only(left: 30, right: 40),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.filterBorder,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(10),
        color: AppColors.surface,
      ),
      child: Row(
        children: [
          Image.asset(
            'assets/icons/search.png',
            width: 16,
            height: 16,
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: AppTextStyles.filterSearchText,
                border: InputBorder.none,
                isDense: true,
                contentPadding: EdgeInsets.zero,
              ),
              style: AppTextStyles.filterSearchText,
            ),
          ),
          Image.asset(
            'assets/icons/sliders.png',
            width: 16,
            height: 16,
          ),
        ],
      ),
    );
  }
}