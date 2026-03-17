import 'package:carpool_admin/utils/models/notification_dummy_data.dart';
import 'package:carpool_admin/widgets/buttons/send_notification_button.dart';
import 'package:carpool_admin/widgets/notifications_widgets/complaints_tab.dart';
import 'package:carpool_admin/widgets/notifications_widgets/notification_tabs.dart';
import 'package:carpool_admin/widgets/notifications_widgets/notifications_table.dart';
import 'package:carpool_admin/widgets/notifications_widgets/stats_card.dart';
import 'package:carpool_admin/widgets/notifications_widgets/table_filters.dart';
import 'package:carpool_admin/widgets/notifications_widgets/templates_tab.dart';
import 'package:flutter/material.dart';
import '../../utils/theme/colors.dart';
import '../../utils/theme/fonts.dart';

/// This is the CONTENT-ONLY version of the Notifications screen
/// It does NOT include MainLayout - that's handled by MainShellScreen
class NotificationsContent extends StatefulWidget {
  const NotificationsContent({Key? key}) : super(key: key);

  @override
  State<NotificationsContent> createState() => _NotificationsContentState();
}

class _NotificationsContentState extends State<NotificationsContent> {
  int _selectedTabIndex = 0;
  final TextEditingController _searchController = TextEditingController();
  String _selectedType = 'All Type';
  String _selectedStatus = 'All Status';
  List<NotificationItem> _filteredNotifications = [];

  @override
  void initState() {
    super.initState();
    _filteredNotifications = NotificationDummyData.notifications;
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _applyFilters() {
    setState(() {
      _filteredNotifications = NotificationDummyData.notifications.where((
        notification,
      ) {
        // Search filter
        final searchLower = _searchController.text.toLowerCase();
        final matchesSearch =
            searchLower.isEmpty ||
            notification.title.toLowerCase().contains(searchLower) ||
            notification.subtitle.toLowerCase().contains(searchLower) ||
            notification.recipients.toLowerCase().contains(searchLower);

        // Type filter
        final matchesType =
            _selectedType == 'All Type' ||
            notification.typeLabel == _selectedType;

        // Status filter
        final matchesStatus =
            _selectedStatus == 'All Status' ||
            notification.status == _selectedStatus;

        return matchesSearch && matchesType && matchesStatus;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Stats Cards Row
            _buildStatsCards(),

            const SizedBox(height: 32),

            // Section Header
            _buildSectionHeader(),

            const SizedBox(height: 24),

            // Tabs
            NotificationTabs(
              selectedIndex: _selectedTabIndex,
              onTabChanged: (index) {
                setState(() => _selectedTabIndex = index);
              },
              complaintsBadgeCount: NotificationDummyData.newComplaints,
            ),

            const SizedBox(height: 16),

            // Tab Content
            _buildTabContent(),
          ],
        ),
      ),
    );
  }

  Widget _buildStatsCards() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final crossAxisCount = width > 1100 ? 4 : 2;
        final spacing = 16.0;
        final itemWidth =
            (constraints.maxWidth - (spacing * (crossAxisCount - 1))) /
            crossAxisCount;

        return Wrap(
          spacing: spacing,
          runSpacing: spacing,
          children: [
            SizedBox(
              width: itemWidth,
              child: StatsCard(
                label: 'Notification',
                value: NotificationDummyData.totalNotifications.toString(),
                iconAsset: 'assets/icons/notification_icons/stats_notification.svg',
              ),
            ),
            SizedBox(
              width: itemWidth,
              child: StatsCard(
                label: 'New Complaints',
                value: NotificationDummyData.newComplaints.toString(),
                iconAsset: 'assets/icons/notification_icons/complaint.svg',
              ),
            ),
            SizedBox(
              width: itemWidth,
              child: StatsCard(
                label: 'In Progress',
                value: NotificationDummyData.inProgress.toString(),
                iconAsset: 'assets/icons/notification_icons/progress.svg',
              ),
            ),
            SizedBox(
              width: itemWidth,
              child: StatsCard(
                label: 'Resolved',
                value: NotificationDummyData.resolved.toString(),
                iconAsset: 'assets/icons/notification_icons/resolved.svg',
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildSectionHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Notifications & Alerts',
          style: TextStyle(
            fontFamily: AppFonts.primary,
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 4),
        const Text(
          'Manage system notification and complaints',
          style: TextStyle(
            fontFamily: AppFonts.primary,
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }

  Widget _buildTabContent() {
    switch (_selectedTabIndex) {
      case 0:
        return Column(
          children: [const SendNotificationButton(), _buildNotificationsTab()],
        );
      case 1:
        return const ComplaintsTab();
      case 2:
        return Column(
          children: [const SendNotificationButton(), const TemplatesTab()],
        );
      default:
        return const SizedBox.shrink();
    }
  }

  Widget _buildNotificationsTab() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.divider, width: 1),
      ),
      child: Column(
        children: [
          // Filters
          TableFilters(
            searchController: _searchController,
            selectedType: _selectedType,
            selectedStatus: _selectedStatus,
            typeOptions: NotificationDummyData.typeOptions,
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

          // Notifications Table
          NotificationsTable(notifications: _filteredNotifications),
        ],
      ),
    );
  }
}
