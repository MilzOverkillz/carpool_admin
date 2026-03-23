import 'package:flutter/material.dart';
import '../../utils/theme/colors.dart';
import '../../utils/theme/text_styles.dart';
import '../dropdowns/company_dropdown.dart'; 

class RidesFilterBar extends StatelessWidget {
  const RidesFilterBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      // Back to a normal Row so Spacer() works!
      child: Row(
        children: [
          _buildSearchFilter(),
          
          // THIS is what pushes the search box to the far left edge!
          const Spacer(), 

          // 1. All Status
          const CompanyDropdownFilter(
            hint: 'All Status', 
            width: 115.0, 
            items: ['All Status', 'Completed', 'Active', 'Scheduled', 'Flagged', 'Cancelled'],
          ),
          const SizedBox(width: 12), // Reduced slightly to fix the overflow error
          
          // 2. All Companies
          const CompanyDropdownFilter(
            hint: 'All Companies', 
            width: 135.0, 
            items: ['All Companies', 'Tech corp Inc', 'Design Studio Ltd', 'Finance solutions', 'Healthcare Pvt', 'Retail Group'],
          ),
          const SizedBox(width: 12), // Reduced slightly
          
          // 3. All Payment
          const CompanyDropdownFilter(
            hint: 'All Payments', 
            width: 125.0, 
            items: ['All Payments', 'Paid', 'Pending', 'Refund'],
          ),
          const SizedBox(width: 12), // Reduced slightly

          // 4. All Dates
          const CompanyDropdownFilter(
            hint: 'All Dates', 
            width: 105.0, 
            items: ['All Dates', 'Today', 'This week', 'This month'],
          ),
        ],
      ),
    );
  }

  // --- Sub-widget: Filter Search Box ---
  Widget _buildSearchFilter() {
    return Container(
      // Exactly 469px width and matched padding from UserFilterBar
      width: 469, 
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