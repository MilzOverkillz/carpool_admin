import 'package:carpool_admin/utils/theme/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../utils/theme/colors.dart';
import '../../../utils/theme/fonts.dart';
import 'custom_dropdown.dart';

class TableFilters extends StatelessWidget {
  final TextEditingController searchController;
  final String selectedType;
  final String selectedStatus;
  final List<String> typeOptions;
  final List<String> statusOptions;
  final ValueChanged<String> onTypeChanged;
  final ValueChanged<String> onStatusChanged;
  final VoidCallback? onSearchChanged;

  const TableFilters({
    Key? key,
    required this.searchController,
    required this.selectedType,
    required this.selectedStatus,
    required this.typeOptions,
    required this.statusOptions,
    required this.onTypeChanged,
    required this.onStatusChanged,
    this.onSearchChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(),
      child: Row(
        children: [
          // Search Bar
          Expanded(
            flex: 2, // ✅ Changed from flex: 2 to flex: 3 for better proportion
            child: Container(
              height: 56, // ✅ Reduced from 60 to 48 for consistency
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.searchBorder, width: 1.2),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 30),
                   SvgPicture.asset(
                    "assets/icons/notification_icons/search.svg",
                    width: 18,
                    height: 18,
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: TextField(
                      controller: searchController,
                      onChanged: (_) => onSearchChanged?.call(),
                      decoration: InputDecoration(
                        hintText: 'Search',
                        border: InputBorder.none,
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                        hintStyle: TextStyle(
                          fontFamily: AppFonts.primary,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: AppColors.black,
                        ),
                      ),
                      style: TextStyle(
                        fontFamily: AppFonts.primary,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.black,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  IconButton(
                    icon: SvgPicture.asset(
                      'assets/icons/notification_icons/filter.svg',
                      width: 18,
                      height: 18,
                    ),
                    onPressed: () {},
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                  const SizedBox(width: 50),
                ],
              ),
            ),
          ),

          const Spacer(), // ✅ Changed from SizedBox(width: 500) to Spacer()
          // Type Dropdown
          CustomDropdown(
            items: typeOptions,
            value: selectedType,
            onChanged: onTypeChanged,
            width: 160,
          ),
          const SizedBox(width: AppSizes.xl),

          // Status Dropdown
          CustomDropdown(
            items: statusOptions,
            value: selectedStatus,
            onChanged: onStatusChanged,
            width: 160,
          ),
        ],
      ),
    );
  }
}
