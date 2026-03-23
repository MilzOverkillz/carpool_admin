import 'package:carpool_admin/utils/models/notification_dummy_data.dart';
import 'package:flutter/material.dart';
import '../../../utils/theme/colors.dart';
import '../../../utils/theme/fonts.dart';
import 'table_filters.dart';

class ComplaintsTab extends StatefulWidget {
  const ComplaintsTab({super.key});

  @override
  State<ComplaintsTab> createState() => _ComplaintsTabState();
}

class _ComplaintsTabState extends State<ComplaintsTab> {
  final TextEditingController _searchController = TextEditingController();
  String _selectedType = 'All Type';
  String _selectedStatus = 'All Status';

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _applyFilters() {
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.divider,
          width: 1,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Filters (Reusing the TableFilters widget)
          TableFilters(
            searchController: _searchController,
            selectedType: _selectedType,
            selectedStatus: _selectedStatus,
            typeOptions: NotificationDummyData.complaintTypeOptions,
            statusOptions: NotificationDummyData.statusOptions,
            onTypeChanged: (value) {
              setState(() => _selectedType = value);
              _applyFilters();
            },
            onStatusChanged: (value) {
              setState(() => _selectedStatus = value);
              _applyFilters();
            },
            onSearchChanged: _applyFilters,
          ),
          
          // TODO: Add Complaints Table here
          // This is where the complaints table will be added later
          Padding(
            padding: const EdgeInsets.all(48.0),
            child: Center(
              child: Text(
                'Complaints Table - Coming Soon',
                style: TextStyle(
                  fontFamily: AppFonts.primary,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textTertiary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}