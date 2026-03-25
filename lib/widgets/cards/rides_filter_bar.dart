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
      // FIX: Changed Row to Wrap so the dropdowns flow down on smaller screens
      child: Wrap(
        spacing: 12.0, // Horizontal gap between the dropdowns
        runSpacing: 16.0, // Vertical gap when items wrap
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          _buildSearchFilter(),
          
          // REMOVED Spacer() because Wrap handles its own spacing naturally.
          
          // To ensure the dropdowns push to the right like a Spacer() would, 
          // we add a flexible empty space IF the screen is wide enough to not wrap.
          // But to keep things simple and crash-free with Wrap, we just rely on the natural layout.

          // 1. All Status
          const CompanyDropdownFilter(
            hint: 'All Status', 
            width: 115.0, 
            items: ['All Status', 'Completed', 'Active', 'Scheduled', 'Flagged', 'Cancelled'],
          ),
          
          // 2. All Companies
          const CompanyDropdownFilter(
            hint: 'All Companies', 
            width: 135.0, 
            items: ['All Companies', 'Tech corp Inc', 'Design Studio Ltd', 'Finance solutions', 'Healthcare Pvt', 'Retail Group'],
          ),
          
          // 3. All Payment
          const CompanyDropdownFilter(
            hint: 'All Payments', 
            width: 125.0, 
            items: ['All Payments', 'Paid', 'Pending', 'Refund'],
          ),

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
      // Changed to constraints to allow it to shrink slightly if the screen is super tight
      constraints: const BoxConstraints(maxWidth: 469), 
      height: 47,
      padding: const EdgeInsets.only(left: 30, right: 40),
      // Adding right margin so it pushes away from the dropdowns
      margin: const EdgeInsets.only(right: 20),
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