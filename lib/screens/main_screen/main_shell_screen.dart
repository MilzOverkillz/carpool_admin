import 'package:carpool_admin/screens/notifications_screen/notifications_content.dart';
import 'package:flutter/material.dart';
import 'package:carpool_admin/utils/theme/colors.dart';
import 'package:carpool_admin/widgets/Sidebar/sidebar.dart';
import 'package:carpool_admin/widgets/nav_bar/top_bar.dart';

// Import all your screen contents (not the full screens with MainLayout)
// import 'package:carpool_admin/screens/dashboard/dashboard_content.dart';
// import 'package:carpool_admin/screens/users/users_content.dart';
// import 'package:carpool_admin/screens/payments/payments_content.dart';
// etc...

class MainShellScreen extends StatefulWidget {
  const MainShellScreen({Key? key}) : super(key: key);

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
        // return const DashboardContent();
        return _buildPlaceholder('Dashboard');
      case 'Companies':
        return _buildPlaceholder('Companies');
      case 'Users':
        // return const UsersContent();
        return _buildPlaceholder('Users');
      case 'Rides':
        return _buildPlaceholder('Rides');
      case 'Payments':
        // return const PaymentsContent();
        return _buildPlaceholder('Payments');
      case 'Analytics':
        return _buildPlaceholder('Analytics');
      case 'Notifications':
        return const NotificationsContent();
      case 'Settings':
        return _buildPlaceholder('Settings');
      default:
        return _buildPlaceholder('Dashboard');
    }
  }

  // Temporary placeholder widget for screens not yet implemented
  Widget _buildPlaceholder(String screenName) {
    return Center(
      child: Text(
        '$screenName Content',
        style: const TextStyle(fontSize: 24),
      ),
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
                Expanded(
                  child: _getContentWidget(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}