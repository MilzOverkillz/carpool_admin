import 'package:carpool_admin/screens/all_ride_section/all_ride_content.dart';
import 'package:carpool_admin/screens/analytic_section/analytics_content.dart';
import 'package:carpool_admin/screens/dashboard/dashboard_overview.dart';
import 'package:carpool_admin/screens/employees_section/employees_content.dart';
import 'package:carpool_admin/utils/routing/routes.dart'; // IMPORTED
import 'package:carpool_admin/utils/theme/colors.dart';
import 'package:carpool_admin/utils/theme/fonts.dart';
import 'package:carpool_admin/widgets/nav_bar/top_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart'; // IMPORTED

class CompanyAdminDashboard extends StatefulWidget {
  const CompanyAdminDashboard({super.key});

  @override
  State<CompanyAdminDashboard> createState() => _CompanyAdminDashboardState();
}

class _CompanyAdminDashboardState extends State<CompanyAdminDashboard> {
  int _selectedTab = 0;
  final List<String> _tabs = ['Overview', 'Employees', 'Rides', 'Analytics'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Header Section ─────────────────────────────────
          Container(
            padding: const EdgeInsets.only(left: 142, right: 20),
            height: 100,
            child: Row(
              children: [
                SizedBox(
                  height: 66,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start, // Better alignment
                    children: [
                      Text(
                        'Gamil Inc',
                        style: TextStyle(
                          fontFamily: AppFonts.primary,
                          fontWeight: FontWeight.w700,
                          fontSize: 34,
                          letterSpacing: -0.02,
                          color: const Color(0xff3c3c3c),
                        ),
                      ),
                      Text(
                        'Company Admin Dashboard',
                        style: TextStyle(
                          fontFamily: AppFonts.dmSans,
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          letterSpacing: -0.02,
                          color: const Color(0xff9ea2a5),
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                const TopBarWidget(title: ''),
                
                // ── LOGOUT BUTTON ──
                GestureDetector(
                  onTap: () => context.go(AppRoutes.portalSelection),
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Container(
                      width: 119,
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(11),
                        color: const Color(0xffEEEEEE),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/icons/dashboard/logout.svg'),
                          const SizedBox(width: 10),
                          Text(
                            'Logout',
                            style: TextStyle(
                              fontFamily: AppFonts.primary,
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: const Color(0xff495056),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // ── Tab Bar ──────────────────────────────────────────────
          Container(
            width: 320.527,
            height: 32,
            padding: const EdgeInsets.symmetric(horizontal: 2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: const Color(0xffe5e8f0),
            ),
            margin: const EdgeInsets.only(left: 142, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(_tabs.length, (i) {
                final bool isSelected = i == _selectedTab;
                return GestureDetector(
                  onTap: () => setState(() => _selectedTab = i),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    margin: const EdgeInsets.only(right: 4),
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: isSelected ? AppColors.white : null,
                    ),
                    height: 28,
                    child: Center(
                      child: Text(
                        _tabs[i],
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: isSelected
                              ? FontWeight.w600
                              : FontWeight.w400,
                          color: isSelected
                              ? const Color(0xFF1E293B)
                              : const Color(0xFF94A3B8),
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
          const SizedBox(height: 22),

          // ── Tab Content ──────────────────────────────────────────
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 142, right: 20),
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 250),
                transitionBuilder: (child, animation) =>
                    FadeTransition(opacity: animation, child: child),
                child: KeyedSubtree(
                  key: ValueKey(_selectedTab),
                  child: [
                    const DashboardOverview(),
                    const EmployeesContent(),
                    const AllRideContent(),
                    const AnalyticsContent(),
                  ][_selectedTab],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}