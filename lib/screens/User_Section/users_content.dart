import 'package:flutter/material.dart';
import '../../utils/theme/colors.dart';
import '../../utils/theme/text_styles.dart';

// IMPORTANT: MainLayout import removed!
import '../../widgets/Cards/user_card.dart'; 
import '../../widgets/dropdowns/add_user_dialog.dart';
import '../../widgets/cards/user_filter_bar.dart'; 

class UsersContent extends StatefulWidget {
  const UsersContent({Key? key}) : super(key: key);

  @override
  State<UsersContent> createState() => _UsersContentState();
}

class _UsersContentState extends State<UsersContent> {
  @override
  Widget build(BuildContext context) {
    // Returning SingleChildScrollView directly, NO MainLayout wrapper!
    return SingleChildScrollView(
      padding: const EdgeInsets.only(
        left: 32.0,
        right: 32.0,
        bottom: 32.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildPageHeader(context), 
          const SizedBox(height: 24),
          _buildMainContentCard(),
        ],
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
          const UserFilterBar(), 
          const Divider(height: 1, color: AppColors.divider),
          _buildDataTable(),
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