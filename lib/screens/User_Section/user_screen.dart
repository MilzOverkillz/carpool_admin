import 'package:flutter/material.dart';
import '../../utils/theme/colors.dart';
import '../../utils/theme/fonts.dart';
import '../../utils/theme/text_styles.dart';

// IMPORTANT: Ensure this path points to your new main_layout.dart file
import '../../widgets/layout/main_layout.dart'; 

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // We now use MainLayout to automatically handle the Sidebar and TopBar!
    return MainLayout(
      pageTitle: 'Users', // This tells the layout to highlight "Users"
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 32.0, right: 32.0, bottom: 32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildPageHeader(),
            const SizedBox(height: 24),
            _buildMainContentCard(),
          ],
        ),
      ),
    );
  }

  // ==========================================
  // Section: Page Header
  // ==========================================
  Widget _buildPageHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        // Title and Subtitle
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'User Management',
              style: AppTextStyles.cardTitle.copyWith(fontSize: 18),
            ),
            const SizedBox(height: 4),
            Text(
              'Mange all users , rolls and permissions', // Kept typo from Figma for exact match
              style: AppTextStyles.caption.copyWith(
                color: const Color(0xFF828282),
              ),
            ),
          ],
        ),

        // Add New User Button
        InkWell(
          onTap: () {
            // Add user action
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: const Color(0xFF4B5563), // Dark Gray Button
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Text(
                  'Add New User',
                  style: AppTextStyles.labelButton.copyWith(
                    fontSize: 13,
                    fontWeight: AppFonts.medium,
                  ),
                ),
                const SizedBox(width: 8),
                const Icon(Icons.add_box_outlined, color: Colors.white, size: 16),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // ==========================================
  // Section: Main White Container (Filters + Table)
  // ==========================================
  Widget _buildMainContentCard() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Color(0x05000000),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Filters Row
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                _buildSearchFilter(),
                const Spacer(),
                _buildDropdownFilter('All Roles'),
                const SizedBox(width: 12),
                _buildDropdownFilter('All Companies'),
                const SizedBox(width: 12),
                _buildDropdownFilter('All Status'),
              ],
            ),
          ),
          
          const Divider(height: 1, color: AppColors.divider),
          
          // Data Table
          _buildDataTable(),
        ],
      ),
    );
  }

  // --- Sub-widget: Filter Search Box ---
  Widget _buildSearchFilter() {
    return Container(
      width: 250,
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.border),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          const Icon(Icons.search, size: 18, color: AppColors.textHint),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: AppTextStyles.bodyMedium.copyWith(color: AppColors.textHint),
                border: InputBorder.none,
                isDense: true,
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ),
          const Icon(Icons.tune, size: 18, color: AppColors.textHint), // Filter settings icon
        ],
      ),
    );
  }

  // --- Sub-widget: Dropdown Filter ---
  Widget _buildDropdownFilter(String hint) {
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.border),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Text(
            hint,
            style: AppTextStyles.bodyMedium.copyWith(fontSize: 13),
          ),
          const SizedBox(width: 8),
          const Icon(Icons.keyboard_arrow_down, size: 18, color: AppColors.iconPrimary),
        ],
      ),
    );
  }

  // ==========================================
  // Section: Data Table Implementation
  // ==========================================
  Widget _buildDataTable() {
    return Column(
      children: [
        // Table Header
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Row(
            children: [
              _buildTableHeader('USER', flex: 3),
              _buildTableHeader('COMPANY', flex: 2),
              _buildTableHeader('ROLE', flex: 1),
              _buildTableHeader('TOTAL RIDES', flex: 1),
              _buildTableHeader('RATING', flex: 1),
              _buildTableHeader('STATUS', flex: 1),
              _buildTableHeader('ACTIONS', flex: 1),
            ],
          ),
        ),
        const Divider(height: 1, color: AppColors.divider),

        // Table Rows (Mock Data based on screenshot)
        _buildTableRow(
          initials: 'SA', name: 'Sithum Anuththara', email: 'admin@carpool.com',
          company: 'Carpool Platform', role: 'Admin', rides: '250', rating: 'N/A', status: 'Active',
        ),
        _buildTableRow(
          initials: 'JS', name: 'John Smith', email: 'johnsmithtechcorp@gmail.com',
          company: 'Tech Corp Inc', role: 'Driver', rides: '200', rating: '2.9', status: 'Inactive',
        ),
        _buildTableRow(
          initials: 'SJ', name: 'Sara Johnson', email: 'sarajohnsonds@gmail.com',
          company: 'Design Studio Ltd', role: 'Rider', rides: '120', rating: '4.5', status: 'Suspend',
        ),
        _buildTableRow(
          avatarUrl: 'https://i.pravatar.cc/150?img=11', // Dummy avatar image
          name: 'Dulanja Hansika', email: 'dulanjahansika@gmail.com',
          company: 'Finance Solutions', role: 'Both', rides: '220', rating: '4.7', status: 'Inactive',
        ),
        const SizedBox(height: 16), // Bottom padding for table
      ],
    );
  }

  // --- Helper: Table Header Text ---
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

  // --- Helper: Table Row Builder ---
  Widget _buildTableRow({
    String? initials,
    String? avatarUrl,
    required String name,
    required String email,
    required String company,
    required String role,
    required String rides,
    required String rating,
    required String status,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.divider)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // 1. User Info (Avatar + Name + Email)
          Expanded(
            flex: 3,
            child: Row(
              children: [
                CircleAvatar(
                  radius: 16,
                  backgroundColor: const Color(0xFF4B5563),
                  backgroundImage: avatarUrl != null ? NetworkImage(avatarUrl) : null,
                  child: initials != null
                      ? Text(initials, style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: AppFonts.medium))
                      : null,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(name, style: AppTextStyles.bodyMedium.copyWith(fontWeight: AppFonts.semibold, color: const Color(0xFF374151))),
                      Text(email, style: AppTextStyles.caption.copyWith(color: const Color(0xFF9CA3AF), fontSize: 11), overflow: TextOverflow.ellipsis),
                    ],
                  ),
                ),
              ],
            ),
          ),
          
          // 2. Company
          Expanded(
            flex: 2,
            child: Text(company, style: AppTextStyles.bodySmall.copyWith(fontWeight: AppFonts.semibold, color: const Color(0xFF4B5563))),
          ),
          
          // 3. Role Pill
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.centerLeft,
              child: _buildPill(role),
            ),
          ),
          
          // 4. Total Rides
          Expanded(
            flex: 1,
            child: Text(rides, style: AppTextStyles.bodySmall.copyWith(fontWeight: AppFonts.semibold, color: const Color(0xFF4B5563))),
          ),
          
          // 5. Rating
          Expanded(
            flex: 1,
            child: Row(
              children: [
                if (rating != 'N/A') const Icon(Icons.star, size: 14, color: Color(0xFF374151)),
                if (rating != 'N/A') const SizedBox(width: 4),
                Text(rating, style: AppTextStyles.bodySmall.copyWith(fontWeight: AppFonts.semibold, color: const Color(0xFF4B5563))),
              ],
            ),
          ),
          
          // 6. Status Pill
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.centerLeft,
              child: _buildPill(status),
            ),
          ),
          
          // 7. Actions
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.border),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Action', style: TextStyle(fontSize: 12, color: Color(0xFF4B5563))),
                  SizedBox(width: 4),
                  Icon(Icons.keyboard_arrow_down, size: 14, color: Color(0xFF4B5563)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // --- Helper: Status/Role Pill ---
  Widget _buildPill(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFFE5E7EB), // Light gray background
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 11,
          fontWeight: AppFonts.medium,
          color: Color(0xFF4B5563),
        ),
      ),
    );
  }
}