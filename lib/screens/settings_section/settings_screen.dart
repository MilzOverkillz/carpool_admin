import 'package:carpool_admin/screens/settings_section/settings_content.dart';
import 'package:carpool_admin/widgets/layout/main_layout.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MainLayout(pageTitle: 'Settings', child: SettingsContent());
  }
}
