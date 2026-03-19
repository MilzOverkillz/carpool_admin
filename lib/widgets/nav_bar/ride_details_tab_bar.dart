import 'package:flutter/material.dart';
import '../../utils/theme/text_styles.dart';

class RideDetailsTabBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTabChanged;

  const RideDetailsTabBar({
    Key? key,
    required this.selectedIndex,
    required this.onTabChanged,
  }) : super(key: key);

  final List<String> tabs = const ['Details', 'Route', 'Participants', 'Payments', 'Ratings'];

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];

    for (int i = 0; i < tabs.length; i++) {
      final isSelected = selectedIndex == i;

      // 1. Build the Tab Button (Automatically becomes ~88.62px width via Expanded)
      children.add(
        Expanded(
          child: GestureDetector(
            onTap: () => onTabChanged(i),
            behavior: HitTestBehavior.opaque,
            child: Container(
              alignment: Alignment.center,
              // The parent container has 2px padding, leaving exactly 28px height for this tab
              decoration: BoxDecoration(
                color: isSelected ? Colors.white : Colors.transparent,
                borderRadius: BorderRadius.circular(6), 
                boxShadow: isSelected
                    ? [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.04),
                          blurRadius: 1,
                          offset: const Offset(0, 3),
                        ),
                        BoxShadow(
                          color: Colors.black.withOpacity(0.12),
                          blurRadius: 8,
                          offset: const Offset(0, 3),
                        ),
                      ]
                    : null,
              ),
              child: Text(
                tabs[i],
                style: AppTextStyles.bodySmall.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                  letterSpacing: -0.24,
                  color: Colors.black, 
                ),
              ),
            ),
          ),
        ),
      );

      // 2. Build the vertical divider
      if (i < tabs.length - 1) {
        bool hideDivider = selectedIndex == i || selectedIndex == i + 1;
        
        children.add(
          Container(
            width: 1,
            height: 16, 
            color: hideDivider 
                ? Colors.transparent 
                : const Color(0xFF8E8E93).withOpacity(0.5), 
          ),
        );
      }
    }

    return Container(
      width: 449, // EXACT Figma Width
      height: 32, // EXACT Figma Height
      padding: const EdgeInsets.all(2), 
      decoration: BoxDecoration(
        color: const Color(0xFF767680).withOpacity(0.12), 
        borderRadius: BorderRadius.circular(8), 
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: children,
      ),
    );
  }
}