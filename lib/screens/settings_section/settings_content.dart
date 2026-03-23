import 'package:carpool_admin/screens/notification_temp.dart';
import 'package:carpool_admin/screens/policies.dart';
import 'package:carpool_admin/screens/setting_temp.dart';
import 'package:carpool_admin/utils/theme/colors.dart';
import 'package:carpool_admin/utils/theme/fonts.dart';
import 'package:carpool_admin/utils/theme/text_styles.dart';
import 'package:carpool_admin/widgets/settngs/automatic_backup.dart';
import 'package:carpool_admin/widgets/settngs/backup_export.dart';
import 'package:carpool_admin/widgets/settngs/privacy_compliance.dart';
import 'package:carpool_admin/widgets/settngs/toggle_status_item.dart';
import 'package:flutter/material.dart';

class SettingsContent extends StatefulWidget {
  const SettingsContent({super.key});

  @override
  State<SettingsContent> createState() => _SettingsContentState();
}

class _SettingsContentState extends State<SettingsContent>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final _appNameController = TextEditingController();
  final _taglineController = TextEditingController();
  final _supportEmailController = TextEditingController();
  final _supportPhoneController = TextEditingController();
  String _selectedTimezone = 'America/New York (EST)';
  String _selectedCurrency = 'USD — US Dollar';
  String _selectedLanguage = 'English';

  final bool _twoFactorEnabled = true;
  final _sessionTimeoutController = TextEditingController();
  final _passwordPolicyController = TextEditingController();

  final List<_AdminUser> _adminUsers = [
    _AdminUser(
      initials: 'SA',
      name: 'Super Admin',
      email: 'admin@carpool.com',
      role: 'Super Admin',
      status: 'Active',
    ),
    _AdminUser(
      initials: 'JD',
      name: 'John Doe',
      email: 'admin@carpool.com',
      role: 'Admin',
      status: 'Active',
    ),
    _AdminUser(
      initials: 'JS',
      name: 'John Smith',
      email: 'admin@carpool.com',
      role: 'Moderator',
      status: 'Active',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
    _tabController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _tabController.dispose();
    _appNameController.dispose();
    _taglineController.dispose();
    _supportEmailController.dispose();
    _supportPhoneController.dispose();
    _sessionTimeoutController.dispose();
    _passwordPolicyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(32),
        child: _buildTabContent(),
      ),
    );
  }

  Widget _buildPageHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'System Settings',
          style: AppTextStyles.cardTitle.copyWith(fontSize: 18),
        ),
        const SizedBox(height: 4),
        Text(
          'Configure global platform settings',
          style: AppTextStyles.caption.copyWith(color: const Color(0xFF828282)),
        ),
      ],
    );
  }

  Widget _buildTabBar() {
    return Container(
      height: 32,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0x1F767680)),
        borderRadius: BorderRadius.circular(8),
        color: const Color(0x1F767680),
      ),
      child: Row(
        children: [
          Expanded(child: _buildSegmentTab('General', 0)),
          _buildSegmentDivider(),
          Expanded(child: _buildSegmentTab('Access Control', 1)),
          _buildSegmentDivider(),
          Expanded(child: _buildSegmentTab('Data Management', 2)),
          _buildSegmentDivider(),
          Expanded(child: _buildSegmentTab('Notifications', 3)),
          _buildSegmentDivider(),
          Expanded(child: _buildSegmentTab('Policies', 4)),
        ],
      ),
    );
  }

  Widget _buildSegmentTab(String label, int index) {
    final isActive = _tabController.index == index;
    return GestureDetector(
      onTap: () {
        _tabController.animateTo(index);
        setState(() {});
      },
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          color: isActive ? AppColors.textInverse : Colors.transparent,
          borderRadius: BorderRadius.circular(7),
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: TextStyle(
            fontFamily: AppFonts.primary,
            fontSize: 13,
            fontWeight: isActive ? AppFonts.semibold : AppFonts.normal,
            color: isActive ? AppColors.textPrimary : AppColors.textPrimary,
          ),
        ),
      ),
    );
  }

  Widget _buildSegmentDivider() {
    return Container(width: 1, height: 24, color: const Color(0x1F767680));
  }

  Widget _buildTabContent() {
    Widget content;
    switch (_tabController.index) {
      case 0:
        content = _buildGeneralTab();
        break;
      case 1:
        content = _buildAccessControlTab();
        break;
      case 2:
        content = _buildDataManagementTab();
        break;
      case 3:
        content = _buildNotificationsTab();
        break;
      case 4:
        content = _buildPoliciesTab();
        break;
      default:
        content = _buildComingSoon(
          [
            'General',
            'Access Control',
            'Data Management',
            'Notifications',
            'Places',
          ][_tabController.index],
        );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(2),
            boxShadow: const [
              BoxShadow(
                color: Color(0x05000000),
                blurRadius: 10,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildPageHeader(),
              const SizedBox(height: 24),
              _buildTabBar(),
            ],
          ),
        ),
        content,
      ],
    );
  }

  Widget _buildComingSoon(String name) {
    return _buildSectionCard(
      title: '',
      child: Container(
        height: 200,
        alignment: Alignment.center,
        child: Text(
          '$name settings coming soon',
          style: AppTextStyles.caption.copyWith(fontSize: 14),
        ),
      ),
    );
  }

  Widget _buildGeneralTab() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionCard(
          title: 'App Branding',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildFormField(
                label: 'Application Name',
                controller: _appNameController,
                hint: 'Carpool Platform',
              ),
              const SizedBox(height: 14),
              Row(
                children: [
                  Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      color: const Color(0xFFD1D5D6),
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: AppColors.border),
                    ),
                    child: const Icon(
                      Icons.image_outlined,
                      color: Color(0xFF6F7279),
                      size: 35,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Please upload your logo, size less than 100KB',
                        style: AppTextStyles.caption.copyWith(
                          fontSize: 12,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 8),
                      OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          backgroundColor: const Color(0xFFC8CECC),
                          side: const BorderSide(color: Colors.black, width: 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                        ),
                        child: Text(
                          'Choose File',
                          style: AppTextStyles.bodySmall.copyWith(
                            color: Colors.black,
                            fontWeight: AppFonts.medium,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 14),
              _buildFormField(
                label: 'Tagline',
                controller: _taglineController,
                hint: 'Your carpool solution',
              ),
              const SizedBox(height: 14),
              _buildFormField(
                label: 'Support Email',
                controller: _supportEmailController,
                hint: 'support@carpool.com',
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 14),
              _buildFormField(
                label: 'Support Phone',
                controller: _supportPhoneController,
                hint: '+94 (234)82',
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 14),
              _buildFormField(
                label: 'Application Name',
                controller: _appNameController,
                hint: 'Carpool Platform',
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        _buildSectionCard(
          title: 'Regional Settings',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildDropdownField(
                label: 'Default Time Zone',
                value: _selectedTimezone,
                items: const [
                  'America/New York (EST)',
                  'UTC',
                  'Asia/Colombo',
                  'Europe/London',
                ],
                onChanged: (v) => setState(() => _selectedTimezone = v!),
              ),
              const SizedBox(height: 14),
              _buildDropdownField(
                label: 'Currency',
                value: _selectedCurrency,
                items: const [
                  'USD — US Dollar',
                  'EUR — Euro',
                  'LKR — Sri Lankan Rupee',
                ],
                onChanged: (v) => setState(() => _selectedCurrency = v!),
              ),
              const SizedBox(height: 14),
              _buildDropdownField(
                label: 'Default Language',
                value: _selectedLanguage,
                items: const ['English', 'Sinhala', 'Tamil'],
                onChanged: (v) => setState(() => _selectedLanguage = v!),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        _buildActionButtons(),
      ],
    );
  }

  //-------------- AccessControl -------------- need to fix the spacing and alignment of this section, also the table design and role/status pills

  Widget _buildAccessControlTab() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionCard(
          title: 'Security Settings',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Two-Factor Authentication',
                    style: AppTextStyles.bodySmall.copyWith(
                      fontWeight: AppFonts.medium,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Require 2FA for all admin accounts',
                    style: AppTextStyles.caption.copyWith(
                      color: const Color(0xFF828282),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              _buildSecurityInputRow(
                label: 'Session Timeout (minutes)',
                controller: _sessionTimeoutController,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 2),
              _buildSecurityInputRow(
                label: 'Password Policy',
                controller: _passwordPolicyController,
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        _buildSectionCard(
          title: '',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Admin Roles & Permissions',
                    style: AppTextStyles.cardTitle.copyWith(fontSize: 14),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF4B5563),
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                    ),
                    child: Text(
                      '+ Add admin users',
                      style: AppTextStyles.bodySmall.copyWith(
                        color: Colors.white,
                        fontWeight: AppFonts.medium,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                child: Row(
                  children: [
                    _buildTableHeader('NAME', flex: 3),
                    _buildTableHeader('EMAIL', flex: 3),
                    _buildTableHeader('ROLE', flex: 2),
                    _buildTableHeader('STATUS', flex: 1),
                    _buildTableHeader('ACTIONS', flex: 1),
                  ],
                ),
              ),
              const Divider(height: 1, color: AppColors.divider),
              ..._adminUsers.map((u) => _buildAdminTableRow(u)),
            ],
          ),
        ),
        const SizedBox(height: 20),
        _buildSectionCard(
          title: 'Permission Templates',
          child: _buildPermissionTemplates(),
        ),
        const SizedBox(height: 24),
        _buildActionButtons(),
      ],
    );
  }

  Widget _buildDataManagementTab() {
    return Column(
      children: [
        _buildSectionCard(title: 'Data Management', child: AutomaticBackup()),
        const SizedBox(height: 20),
        _buildSectionCard(title: 'Backup & Export', child: BackupAndExport()),
        const SizedBox(height: 20),
        _buildSectionCard(
          title: 'Privacy & Compliance',
          child: PrivacyCompliance(),
        ),
        const SizedBox(height: 24),
        _buildActionButtons(),
      ],
    );
  }

  bool gdprCompliant1 = true;
  bool gdprCompliant2 = true;
  bool gdprCompliant3 = true;
  bool gdprCompliant4 = true;
  Widget _buildNotificationsTab() {
    return Column(
      children: [
        _buildSectionCard(
          title: 'Notifications',
          child: ListView(
            shrinkWrap: true,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildSettingsToggle(
                    title: 'Email Notifications',
                    subtitle: 'Send notifications via Email',
                    value: gdprCompliant1,
                    onChanged: (value) {
                      setState(() {
                        gdprCompliant1 = value;
                      });
                    },
                  ),
                  buildSettingsToggle(
                    title: 'SMS Notifications',
                    subtitle: 'Send notifications via SMS',
                    value: gdprCompliant2,
                    onChanged: (value) {
                      setState(() {
                        gdprCompliant2 = value;
                      });
                    },
                  ),
                  buildSettingsToggle(
                    title: 'Push Notifications',
                    subtitle: 'Send push notifications to mobile apps',
                    value: gdprCompliant3,
                    onChanged: (value) {
                      setState(() {
                        gdprCompliant3 = value;
                      });
                    },
                  ),
                  buildSettingsToggle(
                    title: 'In-App Notifications',
                    subtitle: 'Show notifications with the app',
                    value: gdprCompliant4,

                    onChanged: (value) {
                      setState(() {
                        gdprCompliant4 = value;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        _buildSectionCard(
          title: 'System Notifications',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ToggleStatusItem(label: 'Ride Created'),
              ToggleStatusItem(label: 'Ride Cancelled'),
              ToggleStatusItem(label: 'Payment Received'),
              ToggleStatusItem(label: 'Refund Processed'),
              ToggleStatusItem(label: 'Account Verified'),
              ToggleStatusItem(label: 'Complaint Filed'),
              ToggleStatusItem(label: 'New User Registration'),
            ],
          ),
        ),
        const SizedBox(height: 24),
        _buildActionButtons(),
      ],
    );
  }

  Widget _buildPoliciesTab() {
    return Column(
      children: [
        _buildSectionCard(title: 'Default Policies', child: Policies()),
        const SizedBox(height: 24),
        _buildActionButtons(),
      ],
    );
  }

  Widget _buildSectionCard({required String title, required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(2)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x05000000),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title.isNotEmpty) ...[
            Text(
              title,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: AppColors.pageHeaderTitle,
                fontFamily: AppFonts.primary,
              ),
            ),
            const SizedBox(height: 20),
          ],
          child,
        ],
      ),
    );
  }

  Widget _buildFormField({
    required String label,
    required TextEditingController controller,
    required String hint,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyles.caption.copyWith(
            color: AppColors.textPrimary,
            fontWeight: AppFonts.medium,
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 6),
        Container(
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white, // white not surfaceSecondary
            border: Border.all(color: AppColors.border),
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextField(
            controller: controller,
            keyboardType: keyboardType,
            style: AppTextStyles.bodySmall.copyWith(
              color: AppColors.textPrimary,
            ),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: AppTextStyles.bodySmall.copyWith(
                color: AppColors.textHint,
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 10,
              ),
              border: InputBorder.none,
              isDense: true,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDropdownField({
    required String label,
    required String value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyles.caption.copyWith(
            color: AppColors.textPrimary,
            fontWeight: AppFonts.medium,
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 6),
        Container(
          height: 40,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: AppColors.surfaceSecondary,
            border: Border.all(color: AppColors.border),
            borderRadius: BorderRadius.circular(8),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: value,
              isExpanded: true,
              icon: const Icon(
                Icons.keyboard_arrow_down,
                size: 18,
                color: AppColors.iconPrimary,
              ),
              style: AppTextStyles.bodySmall.copyWith(
                color: AppColors.textPrimary,
              ),
              onChanged: onChanged,
              items: items
                  .map((i) => DropdownMenuItem(value: i, child: Text(i)))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSecurityToggleRow({
    required String label,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: AppTextStyles.bodySmall.copyWith(
                  fontWeight: AppFonts.medium,
                ),
              ),
              Switch(
                value: value,
                onChanged: onChanged,
                activeThumbColor: Colors.white,
                activeTrackColor: const Color(0xFF4B5563),
                inactiveThumbColor: Colors.white,
                inactiveTrackColor: AppColors.border,
                trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
              ),
            ],
          ),
          Text(
            subtitle,
            style: AppTextStyles.caption.copyWith(
              color: const Color(0xFF828282),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSecurityInputRow({
    required String label,
    String? subtitle,
    required TextEditingController controller,
    TextInputType keyboardType = TextInputType.text,
    double inputWidth = 140,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: AppTextStyles.bodySmall.copyWith(
              fontWeight: AppFonts.medium,
            ),
          ),
          const SizedBox(height: 4),
          if (subtitle != null)
            Text(
              subtitle,
              style: AppTextStyles.caption.copyWith(
                color: const Color(0xFF828282),
              ),
            ),
          const SizedBox(height: 8),
          Container(
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: AppColors.border),
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextField(
              controller: controller,
              keyboardType: keyboardType,
              style: AppTextStyles.bodySmall.copyWith(
                color: AppColors.textPrimary,
              ),
              decoration: InputDecoration(
                hintStyle: AppTextStyles.bodySmall.copyWith(
                  color: AppColors.textHint,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                border: InputBorder.none,
                isDense: true,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTableHeader(String text, {required int flex}) {
    return Expanded(
      flex: flex,
      child: Text(
        text,
        style: AppTextStyles.tableHeader.copyWith(
          color: const Color(0xFF9CA3AF),
        ),
      ),
    );
  }

  Widget _buildAdminTableRow(_AdminUser user) {
    final colorMap = {
      'Super Admin': [const Color(0xFFEEF2FF), const Color(0xFF3730A3)],
      'Admin': [const Color(0xFFFEF3C7), const Color(0xFF92400E)],
    };
    final c =
        colorMap[user.role] ??
        [const Color(0xFFECFDF5), const Color(0xFF065F46)];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 12),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.divider)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: Row(
              children: [
                CircleAvatar(
                  radius: 14,
                  backgroundColor: c[0],
                  child: Text(
                    user.initials,
                    style: TextStyle(
                      color: c[1],
                      fontSize: 11,
                      fontWeight: AppFonts.semibold,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  user.name,
                  style: AppTextStyles.bodySmall.copyWith(
                    fontWeight: AppFonts.medium,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              user.email,
              style: AppTextStyles.caption.copyWith(
                color: const Color(0xFF9CA3AF),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Align(
              alignment: Alignment.centerLeft,
              child: _buildRolePill(user.role),
            ),
          ),
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.centerLeft,
              child: _buildStatusPill(user.status),
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Text(
                  'Edit',
                  style: AppTextStyles.caption.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
                const Icon(
                  Icons.keyboard_arrow_down,
                  size: 14,
                  color: AppColors.textSecondary,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRolePill(String role) {
    final colorMap = {
      'Super Admin': [const Color(0xFFEEF2FF), const Color(0xFF3730A3)],
      'Admin': [const Color(0xFFFEF3C7), const Color(0xFF92400E)],
    };
    final c =
        colorMap[role] ?? [const Color(0xFFE5E7EB), const Color(0xFF4B5563)];
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      decoration: BoxDecoration(
        color: c[0],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        role,
        style: TextStyle(
          fontFamily: AppFonts.primary,
          fontSize: 11,
          fontWeight: AppFonts.medium,
          color: c[1],
        ),
      ),
    );
  }

  Widget _buildStatusPill(String status) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      decoration: BoxDecoration(
        color: const Color(0xFFECFDF5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        status,
        style: const TextStyle(
          fontFamily: AppFonts.primary,
          fontSize: 11,
          fontWeight: AppFonts.medium,
          color: Color(0xFF065F46),
        ),
      ),
    );
  }

  Widget _buildPermissionTemplates() {
    final templates = [
      _PermissionTemplate(title: 'Super Admin', tags: ['All Permissions']),
      _PermissionTemplate(
        title: 'Admin',
        tags: [
          'Manage Users',
          'Manage Companies',
          'Manage Rides',
          'View Reports',
        ],
      ),
      _PermissionTemplate(
        title: 'Moderators',
        tags: ['Manage Companies', 'Moderate Rides', 'View Users'],
      ),
      _PermissionTemplate(
        title: 'Support',
        tags: ['View Tickets', 'Respond to Users'],
      ),
    ];
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: templates
          .map(
            (t) => SizedBox(
              width:
                  (MediaQuery.of(context).size.width - 240 - 64 - 48 - 36) / 3,
              child: Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: AppColors.surfaceSecondary,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColors.divider),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      t.title,
                      style: AppTextStyles.bodySmall.copyWith(
                        fontWeight: AppFonts.semibold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Wrap(
                      spacing: 6,
                      runSpacing: 6,
                      children: t.tags
                          .map(
                            (tag) => Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.surface,
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(color: AppColors.border),
                              ),
                              child: Text(
                                tag,
                                style: AppTextStyles.caption.copyWith(
                                  fontSize: 11,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
              ),
            ),
          )
          .toList(),
    );
  }

  Widget _buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            side: const BorderSide(color: AppColors.border),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          ),
          child: Text(
            'Reset to Default',
            style: AppTextStyles.bodySmall.copyWith(
              color: AppColors.textSecondary,
              fontWeight: AppFonts.medium,
            ),
          ),
        ),
        const SizedBox(width: 12),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 0, 0, 0),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            elevation: 0,
          ),
          child: Text(
            'Save all changes',
            style: AppTextStyles.bodySmall.copyWith(
              color: Colors.white,
              fontWeight: AppFonts.semibold,
            ),
          ),
        ),
      ],
    );
  }
}

// ── Data Models ────────

class _AdminUser {
  final String initials;
  final String name;
  final String email;
  final String role;
  final String status;

  const _AdminUser({
    required this.initials,
    required this.name,
    required this.email,
    required this.role,
    required this.status,
  });
}

class _PermissionTemplate {
  final String title;
  final List<String> tags;

  const _PermissionTemplate({required this.title, required this.tags});
}
