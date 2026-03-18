import 'package:flutter/material.dart';
import '../../utils/theme/colors.dart';
import '../Sidebar/sidebar.dart'; // Ensure correct path based on your folders
import '../nav_bar/top_bar.dart'; // Ensure correct path based on your folders

class MainLayout extends StatelessWidget {
  final String pageTitle; // This syncs the Sidebar highlight and TopBar text
  final Widget child; // The unique content for each screen

  const MainLayout({
    super.key,
    required this.pageTitle,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Row(
        children: [
          // 1. Sidebar Panel
          SidebarWidget(activeTitle: pageTitle),

          // 2. Main Content Area
          Expanded(
            child: Column(
              children: [
                // Top Bar 
                TopBarWidget(title: pageTitle),

                // 3. Screen Content
                Expanded(
                  child: child,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}