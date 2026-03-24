import 'package:carpool_admin/utils/providers/payment_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:carpool_admin/utils/providers/admin_provider.dart';
import 'package:carpool_admin/utils/providers/auth_provider.dart';
import 'package:carpool_admin/utils/routing/routes.dart';
import 'package:carpool_admin/utils/theme/colors.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => AdminProvider()),
        ChangeNotifierProvider(create: (_) => PaymentProvider()),
      ],
      child: const CarpoolApp(),
    ),
  );
}

class CarpoolApp extends StatelessWidget {
  const CarpoolApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      // Note the .router here
      title: 'Carpool Admin',
      debugShowCheckedModeBanner: false,
      theme: _buildTheme(),
      // Link the GoRouter configuration here
      routerConfig: AppRouter.router,
    );
  }

  ThemeData _buildTheme() {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.background,
      primaryColor: AppColors.primary,
      // (Your existing theme logic from the previous step goes here)
    );
  }
}
