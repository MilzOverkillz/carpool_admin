import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../utils/models/notification_dummy_data.dart';
import '../../../utils/theme/colors.dart';
import '../../../utils/theme/fonts.dart';
import '../../../utils/theme/text_styles.dart';
import 'complaint_details_dialog.dart';

class ComplaintsTable extends StatelessWidget {
  final List<ComplaintItem> complaints;

  const ComplaintsTable({Key? key, required this.complaints}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Table Header
        _buildTableHeader(),

        // Table Rows
        if (complaints.isEmpty)
          _buildEmptyState()
        else
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxHeight: 315, // Limits height to approximately 4 rows
            ),
            child: SingleChildScrollView(
              child: Column(
                children: complaints.asMap().entries.map((entry) {
                  final index = entry.key;
                  final complaint = entry.value;
                  return _buildTableRow(
                    context,
                    complaint,
                    isLast: index == complaints.length - 1,
                  );
                }).toList(),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildTableHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.divider, width: 1)),
      ),
      child: Row(
        children: [
          Expanded(flex: 2, child: _buildHeaderCell('COMPLAINT ID')),
          Expanded(flex: 2, child: _buildHeaderCell('TYPE')),
          Expanded(flex: 2, child: _buildHeaderCell('REPORTER')),
          Expanded(flex: 2, child: _buildHeaderCell('REPORTED USER')),
          Expanded(flex: 2, child: _buildHeaderCell('PRIORITY')),
          Expanded(flex: 2, child: _buildHeaderCell('STATUS')),
          Expanded(flex: 2, child: _buildHeaderCell('DATE')),
          Expanded(
            flex: 1,
            child: _buildHeaderCell(
              'ACTIONS',
              alignment: Alignment.centerRight,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderCell(
    String text, {
    Alignment alignment = Alignment.centerLeft,
  }) {
    return Align(
      alignment: alignment,
      child: Text(
        text,
        style: AppTextStyles.notificationTableHeader.copyWith(),
      ),
    );
  }

  Widget _buildTableRow(
    BuildContext context,
    ComplaintItem complaint, {
    bool isLast = false,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Complaint ID Column
          Expanded(
            flex: 2,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                complaint.id,
                style: AppTextStyles.notificationBodyMedium.copyWith(),
              ),
            ),
          ),

          // Type Column
          Expanded(
            flex: 2,
            child: Align(
              alignment: Alignment.centerLeft,
              child: _buildPill(complaint.complaintType),
            ),
          ),

          // Reporter Column
          Expanded(
            flex: 2,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    complaint.reporterName,
                    style: AppTextStyles.notificationBodyMedium.copyWith(),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    complaint.reporterRole,
                    style: AppTextStyles.notificationCaption.copyWith(
                      fontSize: 14, // Matches light grey subtext
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Reported User Column
          Expanded(
            flex: 2,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    complaint.reportedUserName,
                    style: AppTextStyles.notificationBodyMedium.copyWith(),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    complaint.reportedUserRole,
                    style: AppTextStyles.notificationCaption.copyWith(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Priority Column
          Expanded(
            flex: 2,
            child: Align(
              alignment: Alignment.centerLeft,
              child: _buildPill(complaint.priority),
            ),
          ),

          // Status Column
          Expanded(
            flex: 2,
            child: Align(
              alignment: Alignment.centerLeft,
              child: _buildPill(complaint.status),
            ),
          ),

          // Date Column
          Expanded(
            flex: 2,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                complaint.dateReported,
                style: AppTextStyles.notificationBodyMedium.copyWith(),
              ),
            ),
          ),

          // Actions Column
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.centerRight,
              child: _buildActionButton(context, complaint),
            ),
          ),
        ],
      ),
    );
  }

  // Consolidated pill component for Type, Priority, and Status
  Widget _buildPill(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.blackText100,
        borderRadius: BorderRadius.circular(10), // Fully rounded corners
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontFamily: AppFonts.primary,
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: AppColors.black,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildActionButton(BuildContext context, ComplaintItem complaint) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => ComplaintDetailsDialog(complaint: complaint),
        );
      },
      child: SvgPicture.asset(
        "assets/icons/notification_icons/action_icon.svg",
        width: 16,
        height: 16,
      ),
    );
  }

  Widget _buildEmptyState() {
    return Padding(
      padding: const EdgeInsets.all(48.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.report_problem_outlined,
              size: 48,
              color: AppColors.textTertiary,
            ),
            const SizedBox(height: 16),
            Text(
              'No complaints found',
              style: AppTextStyles.bodyMedium.copyWith(
                fontWeight: FontWeight.w500,
                color: AppColors.textTertiary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
