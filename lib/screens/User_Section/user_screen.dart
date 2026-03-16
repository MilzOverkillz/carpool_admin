import 'package:flutter/material.dart';
import '../../utils/theme/colors.dart';
import '../../utils/theme/text_styles.dart';

// IMPORTANT: Ensure these paths point to your actual files
import '../../widgets/layout/main_layout.dart';
import '../../widgets/Cards/user_card.dart'; // Imports the separated card widget
import '../../widgets/dropdowns/company_dropdown.dart'; // Imports the new dropdown filter widget
import '../../widgets/dropdowns/add_user_dialog.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      pageTitle: 'Users',
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(
          left: 32.0,
          right: 32.0,
          bottom: 32.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildPageHeader(context), // Passed context here to allow the dialog to open
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
  Widget _buildPageHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'User Management',
              style: AppTextStyles.pageHeaderTitle,
            ),
            const Text(
              'Mange all users , rolls and permissions',
              style: AppTextStyles.pageHeaderSubtitle,
            ),
          ],
        ),
        InkWell(
          onTap: () {
            // TRIGGER THE NEW DIALOG WIDGET
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return const AddUserDialog();
              },
            );
          },
          borderRadius: BorderRadius.circular(15),
          child: Container(
            height: 37,
            padding: const EdgeInsets.symmetric(
              horizontal: 25,
              vertical: 10,
            ),
            decoration: BoxDecoration(
              color: AppColors.primaryButtonBg,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Add New User',
                  style: AppTextStyles.primaryButtonText,
                ),
                const SizedBox(width: 10),
                Image.asset(
                  'assets/icons/add_user.png',
                  width: 16,
                  height: 16,
                ),
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
            color: AppColors.shadow,
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                _buildSearchFilter(),
                const Spacer(),
                const CompanyDropdownFilter(
                  hint: 'All Roles', 
                  width: 106.0,
                  items: ['All Roles', 'Company Admin', 'Admin', 'Driver', 'Rider', 'Driver & Rider'],
                ),
                const SizedBox(width: 12),
                const CompanyDropdownFilter(
                  hint: 'All Companies', 
                  width: 132.0,
                  items: ['All Companies', 'Tech corp Inc', 'Design Studio Ltd', 'Finance solutions', 'Healthcare Pvt', 'Retail Group'],
                ),
                const SizedBox(width: 12),
                const CompanyDropdownFilter(
                  hint: 'All Status', 
                  width: 106.0,
                  items: ['All Status', 'Active', 'Inactive', 'Suspend', 'Banned'],
                ),
              ],
            ),
          ),
          const Divider(height: 1, color: AppColors.divider),
          _buildDataTable(),
        ],
      ),
    );
  }

  // --- Sub-widget: Filter Search Box ---
  Widget _buildSearchFilter() {
    return Container(
      width: 469,
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

  // ==========================================
  // Section: Data Table Implementation
  // ==========================================
  Widget _buildDataTable() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24.0,
            vertical: 16.0,
          ),
          child: Row(
            children: [
              _buildTableHeader('USER', flex: 3, align: Alignment.centerLeft),
              _buildTableHeader('COMPANY', flex: 2, align: Alignment.centerLeft),
              _buildTableHeader('ROLE', flex: 2, align: Alignment.center), 
              _buildTableHeader('TOTAL RIDES', flex: 1, align: Alignment.center),
              _buildTableHeader('RATING', flex: 1, align: Alignment.center),
              _buildTableHeader('STATUS', flex: 1, align: Alignment.center),
              _buildTableHeader('ACTIONS', flex: 1, align: Alignment.center),
            ],
          ),
        ),
        const Divider(height: 1, color: AppColors.divider),

        // Calling the separated UserCardWidget
        const UserCardWidget(
          initials: 'SA',
          name: 'Sithum Anuththara',
          email: 'admin@carpool.com',
          company: 'Carpool Platform',
          role: 'Admin',
          rides: '250',
          rating: 'N/A',
          status: 'Active',
        ),
        const UserCardWidget(
          initials: 'JS',
          name: 'John Smith',
          email: 'johnsmithtechcorp@gmail.com',
          company: 'Tech Corp Inc',
          role: 'Driver',
          rides: '200',
          rating: '2.9',
          status: 'Inactive',
        ),
        const UserCardWidget(
          initials: 'SJ',
          name: 'Sara Johnson',
          email: 'sarajohnsonds@gmail.com',
          company: 'Design Studio Ltd',
          role: 'Rider',
          rides: '120',
          rating: '4.5',
          status: 'Suspend',
        ),
        const UserCardWidget(
          initials: 'DH', 
          profileImageName: 'dulanja.jpg', 
          name: 'Dulanja Hansika',
          email: 'dulanjahansika@gmail.com',
          company: 'Finance Solutions',
          role: 'Both',
          rides: '220',
          rating: '4.7',
          status: 'Inactive',
        ),
        const UserCardWidget(
          initials: 'KK',
          name: 'Kebuni Kasunika',
          email: 'admin@carpool.com',
          company: 'Retail Group',
          role: 'Admin',
          rides: '220',
          rating: '1.7',
          status: 'Inactive',
        ),
        const UserCardWidget(
          initials: 'MS', 
          profileImageName: 'manul.jpg', 
          name: 'Manul Singh',
          email: 'admin@carpool.com',
          company: 'Healthcare Pvt',
          role: 'Company Admin',
          rides: '220',
          rating: '2.7',
          status: 'Inactive',
        ),

        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildTableHeader(String text, {required int flex, required Alignment align}) {
    return Expanded(
      flex: flex,
      child: Align(
        alignment: align,
        child: Text(
          text,
          style: AppTextStyles.tableHeader.copyWith(
            color: AppColors.textHint,
          ),
        ),
      ),
    );
  }
}