import 'package:carpool_admin/utils/models/notification_dummy_data.dart';
import 'package:carpool_admin/widgets/notifications_widgets/complaints_table.dart';
import 'package:flutter/material.dart';
import '../../../utils/theme/colors.dart';
import 'table_filters.dart';

class ComplaintsTab extends StatefulWidget {
  const ComplaintsTab({Key? key}) : super(key: key);

  @override
  State<ComplaintsTab> createState() => _ComplaintsTabState();
}

class _ComplaintsTabState extends State<ComplaintsTab> {
  final TextEditingController _searchController = TextEditingController();
  String _selectedType = 'All Type';
  String _selectedStatus = 'All Status';
  List<ComplaintItem> _filteredComplaints = [];

  @override
  void initState() {
    super.initState();
    _filteredComplaints = NotificationDummyData.complaints;
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _applyFilters() {
    setState(() {
      _filteredComplaints =
          NotificationDummyData.complaints.where((complaint) {
        // Search filter
        final searchLower = _searchController.text.toLowerCase();
        final matchesSearch = searchLower.isEmpty ||
            complaint.id.toLowerCase().contains(searchLower) ||
            complaint.complaintType.toLowerCase().contains(searchLower) ||
            complaint.reporterName.toLowerCase().contains(searchLower) ||
            complaint.reportedUserName.toLowerCase().contains(searchLower) ||
            complaint.description.toLowerCase().contains(searchLower);

        // Type filter
        final matchesType = _selectedType == 'All Type' ||
            complaint.complaintType == _selectedType;

        // Status filter
        final matchesStatus = _selectedStatus == 'All Status' ||
            complaint.status == _selectedStatus;

        return matchesSearch && matchesType && matchesStatus;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 24, 24, 0),
      decoration: BoxDecoration(
        color: AppColors.surface,
        border: Border.all(color: AppColors.tableBorder, width: 1),
        boxShadow: [
          // Left shadow (light)
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            offset: const Offset(-2, 0),
            blurRadius: 6,
          ),

          // Right shadow (light)
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            offset: const Offset(2, 0),
            blurRadius: 6,
          ),

          // Bottom shadow (darker)
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: const Offset(1, 9),
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Filters
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

          // Complaints Table
          ComplaintsTable(complaints: _filteredComplaints),
        ],
      ),
    );
  }
}