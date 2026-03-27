import 'dart:ui'; // <--- MUST IMPORT THIS FOR MOUSE DRAGGING!
import 'package:flutter/material.dart';
import '../../utils/theme/colors.dart';
import '../../utils/theme/text_styles.dart';
import '../dropdowns/company_dropdown.dart'; 

class RidesFilterBar extends StatelessWidget {
  const RidesFilterBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Search Bar: 469px
        // Dropdowns: 115 + 135 + 125 + 105 = 480px
        // Spacing: 3 * 12 = 36px
        // Padding: Left 20, Right 50 = 70px
        // Total Minimum Width needed before scrolling = ~1055px
        double barWidth = constraints.maxWidth < 1055 ? 1055 : constraints.maxWidth;

        return ScrollConfiguration(
          // Enables click-and-drag scrolling on Web/Desktop
          behavior: ScrollConfiguration.of(context).copyWith(
            dragDevices: {
              PointerDeviceKind.touch,
              PointerDeviceKind.mouse,
              PointerDeviceKind.trackpad,
            },
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SizedBox(
              // Passing the calculated strict width allows the Spacer() to work!
              width: barWidth, 
              child: Padding(
                // Added the 50px right padding exactly as requested!
                padding: const EdgeInsets.only(left: 20.0, top: 20.0, bottom: 20.0, right: 50.0),
                child: Row(
                  children: [
                    _buildSearchFilter(),
                    
                    // This Spacer now pushes the dropdowns to the far right side
                    const Spacer(), 

                    // 1. All Status
                    const CompanyDropdownFilter(
                      hint: 'All Status', 
                      width: 115.0, 
                      items: ['All Status', 'Completed', 'Active', 'Scheduled', 'Flagged', 'Cancelled'],
                    ),
                    const SizedBox(width: 12),
                    
                    // 2. All Companies
                    const CompanyDropdownFilter(
                      hint: 'All Companies', 
                      width: 135.0, 
                      items: ['All Companies', 'Tech corp Inc', 'Design Studio Ltd', 'Finance solutions', 'Healthcare Pvt', 'Retail Group'],
                    ),
                    const SizedBox(width: 12),
                    
                    // 3. All Payment
                    const CompanyDropdownFilter(
                      hint: 'All Payments', 
                      width: 125.0, 
                      items: ['All Payments', 'Paid', 'Pending', 'Refund'],
                    ),
                    const SizedBox(width: 12),

                    // 4. All Dates
                    const CompanyDropdownFilter(
                      hint: 'All Dates', 
                      width: 105.0, 
                      items: ['All Dates', 'Today', 'This week', 'This month'],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  // --- Sub-widget: Filter Search Box ---
  Widget _buildSearchFilter() {
    return Container(
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