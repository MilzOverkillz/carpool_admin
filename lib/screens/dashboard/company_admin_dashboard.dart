import 'package:carpool_admin/utils/theme/colors.dart';
import 'package:carpool_admin/utils/theme/fonts.dart';
import 'package:carpool_admin/widgets/nav_bar/top_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
          // ── Your existing header ─────────────────────────────────
          Container(
            padding: const EdgeInsets.only(left: 142, right: 20),
            height: 100,
            child: Row(
              children: [
                SizedBox(
                  height: 52,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                    ],
                  ),
                ),
                const Spacer(),
                TopBarWidget(title: ''),
                Container(
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
              ],
            ),
          ),

          // ── Tab Bar ──────────────────────────────────────────────
          Container(
            width: 320.527,
            height: 32,
            padding: EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Color(0xffe5e8f0)),
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
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 6),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(6), color: isSelected? AppColors.white : null),
            height: 28,
            child: Align(
              alignment: Alignment.center,
              child: Text(
              _tabs[i],
              style: TextStyle(
                fontSize: 13,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                color: isSelected ? const Color(0xFF1E293B) : const Color(0xFF94A3B8),
              ),
                        ),
            ),
          )
        ),
      );
    }),
  ),
),
SizedBox(height: 22,),

          // ── Tab Content ──────────────────────────────────────────
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 142, right: 20),
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 250),
                transitionBuilder: (child, animation) => FadeTransition(
                  opacity: animation,
                  child: child,
                ),
                child: KeyedSubtree(
                  key: ValueKey(_selectedTab),
                  child: [
                    const Text('Replace with the Overview Widget'),
                    const Text('Replace with the Employee Widget'),
                    const Text('Replace with the Rides Widget'),
                    const Text('Replace with the Analytics Widget'),
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

