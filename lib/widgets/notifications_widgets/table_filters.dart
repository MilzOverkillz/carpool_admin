import 'package:flutter/material.dart';
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
            flex: 2,
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppColors.divider, width: 1),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 16),
                  const Icon(
                    Icons.search,
                    size: 20,
                    color: AppColors.textTertiary,
                  ),
                  const SizedBox(width: 12),
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
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textTertiary,
                        ),
                      ),
                      style: TextStyle(
                        fontFamily: AppFonts.primary,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  IconButton(
                    icon: const Icon(
                      Icons.tune,
                      size: 20,
                      color: AppColors.textTertiary,
                    ),
                    onPressed: () {},
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                  const SizedBox(width: 12),
                ],
              ),
            ),
          ),
          const SizedBox(width: 500),
          // Type Dropdown
          CustomDropdown(
            items: typeOptions,
            value: selectedType,
            onChanged: onTypeChanged,
            width: 160,
          ),
          const SizedBox(width: 12),
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
