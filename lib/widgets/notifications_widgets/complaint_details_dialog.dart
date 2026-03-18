import 'package:flutter/material.dart';
import '../../../utils/models/notification_dummy_data.dart';
import '../../../utils/theme/colors.dart';
import '../../../utils/theme/fonts.dart';

class ComplaintDetailsDialog extends StatefulWidget {
  final ComplaintItem complaint;

  const ComplaintDetailsDialog({
    Key? key,
    required this.complaint,
  }) : super(key: key);

  @override
  State<ComplaintDetailsDialog> createState() => _ComplaintDetailsDialogState();
}

class _ComplaintDetailsDialogState extends State<ComplaintDetailsDialog> {
  final TextEditingController _resolutionNotesController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    _resolutionNotesController.text = widget.complaint.resolutionNotes ?? '';
  }

  @override
  void dispose() {
    _resolutionNotesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isResolved = widget.complaint.status == 'Resolved';

    return Dialog(
      backgroundColor: AppColors.surface,
      elevation: 4,
      // Updated to match the rounded corners in the design
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        width: 540,
        padding: const EdgeInsets.all(32),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header with Title and Close Button
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Complaint Details',
                        style: TextStyle(
                          fontFamily: AppFonts.primary,
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'CMP - 2025 - 001',
                        style: TextStyle(
                          fontFamily: AppFonts.primary,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.blackText200, // Light gray matching image
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.close_rounded, size: 24),
                    color: AppColors.textPrimary,
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // Ride Status and Priority Row
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Ride Status',
                          style: TextStyle(
                            fontFamily: AppFonts.primary,
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: AppColors.blackText200,
                          ),
                        ),
                        const SizedBox(height: 8),
                        _buildDarkPillBadge(widget.complaint.rideStatus),
                      ],
                    ),
                  ),
                  const SizedBox(width: 24),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Priority',
                          style: TextStyle(
                            fontFamily: AppFonts.primary,
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: AppColors.blackText200,
                          ),
                        ),
                        const SizedBox(height: 8),
                        _buildDarkPillBadge(widget.complaint.priority),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 28),

              // Reporter Section (Two Columns)
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Reporter',
                          style: TextStyle(
                            fontFamily: AppFonts.primary,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textTertiary,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          widget.complaint.reporterName,
                          style: const TextStyle(
                            fontFamily: AppFonts.primary,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          widget.complaint.reporterEmail,
                          style: const TextStyle(
                            fontFamily: AppFonts.primary,
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: AppColors.blackText200,
                          ),
                        ),
                        const SizedBox(height: 10),
                        _buildLightPillBadge(widget.complaint.reporterRole),
                      ],
                    ),
                  ),
                  const SizedBox(width: 24),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Reporter',
                          style: TextStyle(
                            fontFamily: AppFonts.primary,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textTertiary,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          widget.complaint.reportedUserName,
                          style: const TextStyle(
                            fontFamily: AppFonts.primary,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          widget.complaint.reportedUserEmail,
                          style: const TextStyle(
                            fontFamily: AppFonts.primary,
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: AppColors.blackText200,
                          ),
                        ),
                        const SizedBox(height: 10),
                        _buildLightPillBadge(widget.complaint.reportedUserRole),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // Info Fields
              _buildInfoField(
                label: 'Complaint Type',
                value: widget.complaint.complaintType,
              ),
              const SizedBox(height: 20),
              _buildInfoField(
                label: 'Description',
                value: widget.complaint.description,
              ),
              const SizedBox(height: 20),
              _buildInfoField(
                label: 'Related - Ride',
                value: widget.complaint.relatedRideId,
              ),
              const SizedBox(height: 20),
              _buildInfoField(
                label: 'Date Reported',
                value: widget.complaint.dateReported,
              ),
              const SizedBox(height: 28),

              // Resolution Notes
              const Text(
                'Resolution Notes',
                style: TextStyle(
                  fontFamily: AppFonts.primary,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _resolutionNotesController,
                maxLines: 3,
                style: const TextStyle(
                  fontFamily: AppFonts.primary,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textPrimary,
                ),
                decoration: InputDecoration(
                  hintText: 'Add notes about the resolution...',
                  hintStyle: const TextStyle(
                    fontFamily: AppFonts.primary,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textHint2,
                  ),
                  filled: true,
                  fillColor: AppColors.surface,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 16,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: AppColors.border, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: AppColors.textPrimary,
                      width: 1.5,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),

              // Action Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // Escalate Button
                  OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(
                        color: AppColors.border,
                        width: 1,
                      ),
                      backgroundColor: AppColors.surface,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 16,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Escalate',
                      style: TextStyle(
                        fontFamily: AppFonts.primary,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                  
                  if (!isResolved) const SizedBox(width: 12),

                  // Mark as Resolved Button
                  if (!isResolved)
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.blackText400,
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 16,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Mark as Resolved',
                        style: TextStyle(
                          fontFamily: AppFonts.primary,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                    
                  const SizedBox(width: 12),

                  // Contact User Button
                  OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(
                        color: AppColors.border,
                        width: 1,
                      ),
                      backgroundColor: AppColors.surface,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 16,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Contact User',
                      style: TextStyle(
                        fontFamily: AppFonts.primary,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Dark pill badge for "New" and "High"
  Widget _buildDarkPillBadge(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFF757575), // Dark gray matching the image
        borderRadius: BorderRadius.circular(20), // Pill shape
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontFamily: AppFonts.primary,
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: AppColors.white,
        ),
      ),
    );
  }

  // Light pill badge for "Rider" and "Driver"
  Widget _buildLightPillBadge(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFFE5E7EB), // Light gray background
        borderRadius: BorderRadius.circular(20), // Pill shape
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontFamily: AppFonts.primary,
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: AppColors.textPrimary,
        ),
      ),
    );
  }

  // Helper method for standard info fields
  Widget _buildInfoField({required String label, required String value}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontFamily: AppFonts.primary,
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: AppColors.blackText200,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          value,
          style: const TextStyle(
            fontFamily: AppFonts.primary,
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: AppColors.textPrimary,
          ),
        ),
      ],
    );
  }
}