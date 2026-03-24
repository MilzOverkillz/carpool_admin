import 'package:carpool_admin/utils/theme/colors.dart';
import 'package:carpool_admin/utils/theme/fonts.dart';
import 'package:carpool_admin/utils/theme/text_styles.dart';
import 'package:carpool_admin/widgets/badges/custom_badge.dart';
import 'package:carpool_admin/widgets/dialogs/add_company_dialog.dart';
import 'package:carpool_admin/widgets/filters/status_filter.dart';
import 'package:carpool_admin/widgets/layout/management_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Companies extends StatefulWidget {
  const Companies({super.key});

  @override
  State<Companies> createState() => _CompaniesState();
}

class _CompaniesState extends State<Companies> {
  String selectedStatus = "All Status";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 32.0, right: 32.0, bottom: 32.0),
      child: ManagementLayout(
        title: "Company Managment",
        subtitle: "Manage Organization using your carpool application",
        actionButtonText: "Add New Company",
        actionButtonIcon: Icons.add_box_outlined,
        onActionPressed: () {
          showDialog(
            context: context,
            barrierColor: Colors.black.withOpacity(0.4),
            builder: (_) => const AddCompanyDialog(),
          );
        },
        searchHint: "Search",
        trailingToolbarWidget: StatusFilterDropdown(
          options: const ["All Status", "Active", "Inactive", "Pending Approval"],
          initialValue: "All Status",
          onChanged: (value) => setState(() => selectedStatus = value),
        ),

        headerRow: _buildHeaderRow(),

        items: [
          _buildCompanyRow("Techcorp Inc", "2024-01-15", "@Techcorp.com", "Paid", "250", "34", "Complete"),
          _buildCompanyRow("Designstudio Ltd", "2024-01-15", "@Designstudio.com", "Custom", "200", "28", "Rejected"),
          _buildCompanyRow("Healthplus", "2024-01-15", "@Healthplus.com", "Free", "120", "50", "Pending"),
          _buildCompanyRow("Retailup", "2024-01-15", "@Retailup.com", "Paid", "220", "67", "Rejected"),
        ],
      ),
    );
  }
}

Widget _buildHeaderRow() {
  return Row(
    children: [
      Expanded(flex: 3, child: Text("COMPANY", style: AppTextStyles.companyTableHeader)),
      // ← changed: all middle headers centered
      Expanded(flex: 2, child: Text("DOMAIN", style: AppTextStyles.companyTableHeader, textAlign: TextAlign.start)),
      Expanded(flex: 2, child: Text("SUBSCRIPTIONS", style: AppTextStyles.companyTableHeader, textAlign: TextAlign.center)),
      Expanded(flex: 2, child: Text("EMPLOYEE", style: AppTextStyles.companyTableHeader, textAlign: TextAlign.center)),
      Expanded(flex: 2, child: Text("ACTIVE RIDES", style: AppTextStyles.companyTableHeader, textAlign: TextAlign.center)),
      Expanded(flex: 2, child: Text("STATUS", style: AppTextStyles.companyTableHeader, textAlign: TextAlign.center)),
      Expanded(flex: 1, child: Text("ACTIONS", style: AppTextStyles.companyTableHeader, textAlign: TextAlign.center)),
    ],
  );
}

Widget _buildCompanyRow(
  String name,
  String date,
  String domain,
  String sub,
  String emp,
  String rides,
  String status,
) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      // Company — left aligned as before
      Expanded(
        flex: 3,
        child: Row(
          children: [
            SvgPicture.asset('assets/icons/dashboard/approval.svg'),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start, // ← fixed back to start
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontFamily: AppFonts.primary,
                    fontSize: 14,
                    letterSpacing: -0.02,
                    color: Color(0xff1e272e),
                  ),
                ),
                Text(
                  "Joined $date",
                  style: const TextStyle(fontSize: 12, color: Color(0xFF94A3B8)),
                ),
              ],
            ),
          ],
        ),
      ),

      // ← changed: all middle columns centered
      Expanded(
        flex: 2,
        child: Text(domain, style: const TextStyle(fontWeight: FontWeight.w600, color: Color(0xFF1E293B))),
      ),

      Expanded(
        flex: 2,
        child: Center(
          child: CustomBadge(
            text: sub,
            backgroundColor: sub == "Free" ? Colors.grey.shade300 : const Color(0xFFCBD5E1),
            textColor: const Color(0xFF475569),
          ),
        ),
      ),

      Expanded(
        flex: 2,
        child: Center(
          child: Text(emp, style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF1E293B))),
        ),
      ),

      Expanded(
        flex: 2,
        child: Center(
          child: Text(rides, style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF1E293B))),
        ),
      ),

      Expanded(
        flex: 2,
        child: Center(
          child: CustomBadge(
            text: status,
            backgroundColor: const Color(0xFFCBD5E1),
            textColor: const Color(0xFF475569),
          ),
        ),
      ),

      // ← changed: Action button styled to match screenshot
      Expanded(
        flex: 1,
        child: Center(
          child: Container(
            width: 89,
            height: 26,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: const Color(0xFFE9E9EA)),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text("Action", style: TextStyle(fontWeight: FontWeight.w600,fontSize: 12, color: Color(0xFF74797D), fontFamily: AppFonts.primary)),
                  SizedBox(width: 2),
                  Icon(Icons.keyboard_arrow_down, size: 16, color:AppColors.black),
                ],
              ),
            ),
          ),
        ),
      ),
    ],
  );
}