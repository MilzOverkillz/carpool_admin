import 'package:carpool_admin/widgets/settngs/automatic_backup.dart';
import 'package:carpool_admin/widgets/settngs/backup_export.dart';
import 'package:carpool_admin/widgets/settngs/privacy_compliance.dart';
import 'package:flutter/material.dart';

class SettingTemp extends StatelessWidget {
  const SettingTemp({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [AutomaticBackup(), BackupAndExport(), PrivacyCompliance()],
    );
  }
}
