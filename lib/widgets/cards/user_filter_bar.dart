import 'dart:ui'; // <--- MUST IMPORT THIS FOR MOUSE DRAGGING!
import 'package:flutter/material.dart';
import '../../utils/theme/colors.dart';
import '../../utils/theme/text_styles.dart';

// Ensure this path points to your actual dropdown widget
import '../dropdowns/company_dropdown.dart'; 

class UserFilterBar extends StatelessWidget {
  const UserFilterBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Search Bar: 469px
        // Dropdowns: 106 + 132 + 106 = 344px
        // Spacing: 2 * 28 = 56px
        // Padding: Left 20, Right 50 = 70px
        // Total Minimum Width needed before scrolling = ~950px. We use 970px to be safe.
        double barWidth = constraints.maxWidth < 970 ? 970 : constraints.maxWidth;

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
                    
                    // This Spacer pushes the dropdowns to the far right side
                    const Spacer(), 

                    const CompanyDropdownFilter(
                      hint: 'All Roles', 
                      width: 106.0,
                      items: ['All Roles', 'Company Admin', 'Admin', 'Driver', 'Rider', 'Driver & Rider'],
                    ),
                    const SizedBox(width: 28), // Restored the spacing between dropdowns
                    
                    const CompanyDropdownFilter(
                      hint: 'All Companies', 
                      width: 132.0,
                      items: ['All Companies', 'Tech corp Inc', 'Design Studio Ltd', 'Finance solutions', 'Healthcare Pvt', 'Retail Group'],
                    ),
                    const SizedBox(width: 28), // Restored the spacing between dropdowns
                    
                    const CompanyDropdownFilter(
                      hint: 'All Status', 
                      width: 106.0,
                      items: ['All Status', 'Active', 'Inactive', 'Suspend', 'Banned'],
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