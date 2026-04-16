import 'package:carpool_admin/utils/theme/colors.dart';
import 'package:carpool_admin/utils/theme/fonts.dart';
import 'package:flutter/material.dart';

import '../../utils/theme/text_styles.dart';

class EmployeesContent extends StatelessWidget {
  const EmployeesContent({super.key});

  final List<_Employee> _employees = const [
    _Employee(
      initials: 'JS',
      name: 'John Smith',
      email: 'johnsmith@techcorp.com',
      role: 'Driver',
      totalRides: 126,
      status: 'Active',
    ),
    _Employee(
      initials: 'JS',
      name: 'John Smith',
      email: 'johnsmith@techcorp.com',
      role: 'Rider',
      totalRides: 126,
      status: 'Active',
    ),
    _Employee(
      initials: 'JS',
      name: 'John Smith',
      email: 'johnsmith@techcorp.com',
      role: 'Both',
      totalRides: 126,
      status: 'Inactive',
    ),
    _Employee(
      initials: 'JS',
      name: 'John Smith',
      email: 'johnsmith@techcorp.com',
      role: 'Driver',
      totalRides: 126,
      status: 'Active',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(left: 15, right: 32, bottom: 360, top: 0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Color(0x0A000000),
              blurRadius: 12,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Header inside white box ──
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Employee List',
                    style: AppTextStyles.cardTitle.copyWith(fontSize: 20),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'View All registered employee from your company',
                    style: AppTextStyles.caption.copyWith(
                      color: const Color(0xFF9CA3AF),
                    ),
                  ),
                ],
              ),
            ),

            // ── Table Header ──
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
              child: Row(
                children: [
                  _buildTableHeader('Name', flex: 4),
                  _buildTableHeader('Email', flex: 4),
                  _buildTableHeader('Role', flex: 2),
                  _buildTableHeader('Total Rides', flex: 2),
                  _buildTableHeader('Status', flex: 2),
                ],
              ),
            ),

            const Divider(height: 1, color: Color(0xFFF0F0F0)),

            // ── Rows ──
            ..._employees.map((e) => _buildTableRow(e)),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  Widget _buildTableHeader(String text, {required int flex}) {
    return Expanded(
      flex: flex,
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Color(0xFF666666),
          fontFamily: AppFonts.primary,
        ),
      ),
    );
  }

  Widget _buildTableRow(_Employee employee) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Name + Avatar
          Expanded(
            flex: 4,
            child: Row(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: const Color(0xFF374151),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    employee.initials,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      fontFamily: AppFonts.primary,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  employee.name,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF111827),
                    fontFamily: AppFonts.primary,
                  ),
                ),
              ],
            ),
          ),

          // Email
          Expanded(
            flex: 4,
            child: Text(
              employee.email,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: Color(0xFF111827),
                fontFamily: AppFonts.primary,
              ),
            ),
          ),

          // Role pill
          Expanded(
            flex: 2,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.centerLeft,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: AppColors.blackText100,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  employee.role,
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: AppColors.black,
                    fontFamily: AppFonts.primary,
                  ),
                ),
              ),
            ),
          ),

          // Total Rides
          Expanded(
            flex: 2,
            child: Text(
              employee.totalRides.toString(),
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: AppColors.black,
                fontFamily: AppFonts.primary,
              ),
            ),
          ),

          // Status pill
          Expanded(
            flex: 2,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.centerLeft,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: employee.status == 'Active'
                      ? const Color(0xFF646464)
                      : const Color(0xFFC7C9CB),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  employee.status,
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    fontFamily: AppFonts.primary,
                    color: employee.status == 'Active'
                        ? Colors.white
                        : const Color(0xFF1E272E),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Data Model ───────────────────────────────────────────────────────────────

class _Employee {
  final String initials;
  final String name;
  final String email;
  final String role;
  final int totalRides;
  final String status;

  const _Employee({
    required this.initials,
    required this.name,
    required this.email,
    required this.role,
    required this.totalRides,
    required this.status,
  });
}
