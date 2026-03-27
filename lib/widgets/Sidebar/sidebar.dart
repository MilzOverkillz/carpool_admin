import 'package:carpool_admin/utils/routing/routes.dart'; // Ensure correct import for AppRoutes
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart'; // Added GoRouter import
import '../../utils/theme/colors.dart';
import '../../utils/theme/fonts.dart';
import '../../utils/theme/text_styles.dart';

class SidebarWidget extends StatelessWidget {
  final String activeTitle;
  final Function(String)? onNavigate; // Callback for navigation

  const SidebarWidget({Key? key, required this.activeTitle, this.onNavigate})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      color: AppColors.surface,
      child: Column(
        children: [
          // Logo/Carpool Title
          const SizedBox(height: 20),

          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 40.0),
              child: const Text('Carpool', style: AppTextStyles.sidebarLogo),
            ),
          ),

          const SizedBox(height: 32),

          // Menu Items
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              physics: const BouncingScrollPhysics(),
              children: [
                _buildMenuItem('Dashboard', activeTitle == 'Dashboard'),
                _buildMenuItem('Companies', activeTitle == 'Companies'),
                _buildMenuItem('Users', activeTitle == 'Users'),
                _buildMenuItem('Rides', activeTitle == 'Rides'),
                _buildMenuItem('Payments', activeTitle == 'Payments'),
                _buildMenuItem('Analytics', activeTitle == 'Analytics'),
                _buildMenuItem('Notifications', activeTitle == 'Notifications'),
                _buildMenuItem('Settings', activeTitle == 'Settings'),
              ],
            ),
          ),

          // Profile Section
          _buildProfileSection(),
          const SizedBox(height: 16),

          // Logout Button - Now updated with navigation
          _buildLogoutButton(context), 
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  /// Helper to build a menu item
  Widget _buildMenuItem(String title, bool isActive) {
    final styleBase = TextStyle(
      fontFamily: AppFonts.primary,
      fontSize: 14,
      fontWeight: isActive ? AppFonts.semibold : AppFonts.medium,
      letterSpacing: isActive ? 0.3 : null,
      color: isActive ? Colors.white : const Color(0xFF202224),
    );

    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: InkWell(
        onTap: () {
          onNavigate?.call(title);
        },
        child: SizedBox(
          width: 240,
          height: 50,
          child: Row(
            children: [
              Container(
                width: 4,
                height: 50,
                decoration: BoxDecoration(
                  color: isActive
                      ? const Color(0xFF495056)
                      : Colors.transparent,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(4),
                    bottomRight: Radius.circular(4),
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Container(
                width: 192,
                height: 50,
                padding: const EdgeInsets.only(left: 24.0),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: isActive
                      ? const Color(0xFF495056)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(6.0),
                ),
                child: Text(title, style: styleBase),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileSection() {
    return Container(
      width: 230,
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: const Color(0xFFF4F7FE),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: const BoxDecoration(
              color: Color(0xFF74797D),
              shape: BoxShape.circle,
            ),
            child: const Center(
              child: Text(
                'M',
                style: TextStyle(
                  fontFamily: AppFonts.primary,
                  color: Colors.white,
                  fontWeight: AppFonts.semibold,
                  fontSize: 14,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hansika Hettiarachchi',
                  style: TextStyle(
                    fontFamily: AppFonts.primary,
                    fontWeight: AppFonts.medium,
                    fontSize: 12,
                    color: Color(0xFF1E272E),
                    height: 1.0,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 2),
                Text(
                  'knightowl@gmail.com',
                  style: TextStyle(
                    fontFamily: AppFonts.primary,
                    fontWeight: AppFonts.normal,
                    fontSize: 10,
                    color: Color(0xFF828282),
                    height: 1.3,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Updated Logout Button Logic
  Widget _buildLogoutButton(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigates back to the very first portal selection screen
        context.go(AppRoutes.portalSelection);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icons/dashboard/logout.png',
              width: 18,
              height: 18,
            ),
            const SizedBox(width: 8),
            const Text(
              'Logout',
              style: TextStyle(
                fontFamily: AppFonts.primary,
                fontWeight: AppFonts.medium,
                fontSize: 12,
                color: Color(0xFF495056),
              ),
            ),
          ],
        ),
      ),
    );
  }
}