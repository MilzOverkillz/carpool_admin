import 'package:flutter/material.dart';
import '../../../utils/theme/colors.dart';
import '../../../utils/theme/fonts.dart';

class NotificationTabs extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTabChanged;
  final int? complaintsBadgeCount;

  const NotificationTabs({
    Key? key,
    required this.selectedIndex,
    required this.onTabChanged,
    this.complaintsBadgeCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 26, 0),
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: AppColors.tabsSelection.withOpacity(0.5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Expanded(
            child: _buildTab(
              label: 'Notifications',
              isSelected: selectedIndex == 0,
              onTap: () => onTabChanged(0),
            ),
          ),
          _buildDivider(),

          Expanded(
            child: _buildTab(
              label: 'Complaints',
              isSelected: selectedIndex == 1,
              onTap: () => onTabChanged(1),
              badgeCount: complaintsBadgeCount,
            ),
          ),
          _buildDivider(),

          Expanded(
            child: _buildTab(
              label: 'Templates',
              isSelected: selectedIndex == 2,
              onTap: () => onTabChanged(2),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      height: 18,
      width: 1,
      color: AppColors.textSecondary.withOpacity(0.3),
    );
  }

  Widget _buildTab({
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
    int? badgeCount,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(6),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ]
              : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: TextStyle(
                fontFamily: AppFonts.primary,
                fontSize: 14,
                fontWeight: isSelected ? FontWeight.w700 : FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
            if (badgeCount != null && badgeCount > 0) ...[
              const SizedBox(width: 28),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: AppColors.textPrimary,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  badgeCount.toString(),
                  style: const TextStyle(
                    fontFamily: AppFonts.primary,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
