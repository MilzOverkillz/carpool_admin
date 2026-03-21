import 'package:carpool_admin/utils/theme/colors.dart';
import 'package:carpool_admin/utils/theme/fonts.dart';
import 'package:carpool_admin/widgets/settngs/exportdialog.dart';
import 'package:carpool_admin/widgets/settngs/uploaddialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BackupAndExport extends StatelessWidget {
  const BackupAndExport({super.key});

  void _showImportDialog(BuildContext context) {
    showDialog(context: context, builder: (context) => const UploadDialog());
  }

  void _showExportDialog(BuildContext context) {
    showDialog(context: context, builder: (context) => const ExportDialog());
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Backup & Export',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: AppColors.pageHeaderTitle,
                fontFamily: AppFonts.primary,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    "Create Manual Backup",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                InkWell(
                  onTap: () => _showImportDialog(context),
                  borderRadius: BorderRadius.circular(12),
                  child: Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: AppColors.authHeading),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset('assets/icons/settings/upload.svg'),
                          const Text(
                            "Import Data",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              fontFamily: AppFonts.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            _buildExportTile("Export All Data", context),
            _buildExportTile("Export User Data", context),
            _buildExportTile("Export Ride Data", context),
            _buildExportTile("Export Payment Data", context),
          ],
        ),
      ),
    );
  }

  Widget _buildExportTile(String title, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => _showExportDialog(context),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/icons/settings/download.svg'),
              const SizedBox(width: 10),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,

                  fontFamily: AppFonts.primary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
