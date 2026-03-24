import 'package:carpool_admin/screens/company_section/companies.dart';
import 'package:carpool_admin/screens/main_dashboard_section/main_dashboard.dart';
import 'package:carpool_admin/screens/notifications_screen/notifications_content.dart';
import 'package:carpool_admin/screens/policies.dart';
import 'package:carpool_admin/screens/reports_and_analytics/analytics.dart';
import 'package:carpool_admin/screens/setting_temp.dart';
import 'package:carpool_admin/screens/settings_section/settings_content.dart';
import 'package:flutter/material.dart';
import 'package:carpool_admin/utils/theme/colors.dart';
import 'package:carpool_admin/widgets/Sidebar/sidebar.dart';
import 'package:carpool_admin/widgets/nav_bar/top_bar.dart';
import 'package:flutter/material.dart';

// IMPORTING YOUR NEW CONTENT SCREENS HERE
import 'package:carpool_admin/screens/User_Section/users_content.dart';
import 'package:carpool_admin/screens/Rides_Section/rides_content.dart';

class MainShellScreen extends StatefulWidget {
  const MainShellScreen({super.key});

  @override
  State<MainShellScreen> createState() => _MainShellScreenState();
}

class _MainShellScreenState extends State<MainShellScreen> {
  // Track which screen is currently active
  String _activeScreen = 'Dashboard';

  // Method to change the active screen
  void _navigateTo(String screenName) {
    setState(() {
      _activeScreen = screenName;
    });
  }

  // Get the content widget based on active screen
  Widget _getContentWidget() {
    switch (_activeScreen) {
      case 'Dashboard':
        return MainDashboard();
      case 'Companies':
        return Companies();
      case 'Users':
        return const UsersContent(); // <-- REPLACED PLACEHOLDER WITH YOUR SCREEN
      case 'Rides':
        return const RidesContent(); // <-- REPLACED PLACEHOLDER WITH YOUR SCREEN
      case 'Payments':
        return _buildPlaceholder('Payments');
      case 'Analytics':
        return const Analytics();
      case 'Notifications':
        return const NotificationsContent();
      case 'Settings':
        return const SettingsContent();
      default:
        return _buildPlaceholder('Dashboard');
    }
  }

  // Temporary placeholder widget for screens not yet implemented
  Widget _buildPlaceholder(String screenName) {
    return Center(
      child: Text('$screenName Content', style: const TextStyle(fontSize: 24)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainBackground,
      body: Row(
        children: [
          // 1. FIXED SIDEBAR (never rebuilds)
          SidebarWidget(
            activeTitle: _activeScreen,
            onNavigate: _navigateTo, // Pass callback to handle navigation
          ),

          // 2. MAIN CONTENT AREA (only this changes)
          Expanded(
            child: Column(
              children: [
                // FIXED TOP BAR (never rebuilds, but title updates)
                TopBarWidget(title: _activeScreen),

                // DYNAMIC CONTENT AREA (this is the only part that changes)
                Expanded(child: _getContentWidget()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
