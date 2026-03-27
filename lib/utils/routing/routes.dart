import 'package:carpool_admin/screens/company_admin/company_admin_login.dart';
import 'package:carpool_admin/screens/dashboard/company_admin_dashboard.dart';
import 'package:carpool_admin/screens/login_and_register_section/forgot_password.dart';
import 'package:carpool_admin/screens/login_and_register_section/reset_password.dart';
import 'package:carpool_admin/screens/login_and_register_section/sign_in.dart';
import 'package:carpool_admin/screens/login_and_register_section/sign_up.dart';
import 'package:carpool_admin/screens/login_and_register_section/verification.dart';
import 'package:carpool_admin/screens/main_screen/main_shell_screen.dart';
import 'package:carpool_admin/screens/portal_selection/dmin_portal_selection_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// AppRoutes provides a central place for all route path strings.
abstract class AppRoutes {
  // Entry Point
  static const String portalSelection = '/portal-selection';
  
  // Platform Admin Auth Flow
  static const String signIn = '/sign-in';
  static const String signUp = '/sign-up';
  static const String verification = '/verification';
  static const String forgotPassword = '/forgot-password';
  static const String resetPassword = '/reset-password';

  // Main App Shell (Dashboard, Users, Rides, etc.)
  static const String mainScreen = '/main-screen';
  
  // Company Admin Flow
  static const String companyAdminSignIn = '/company-admin-sign-in';
  static const String companyAdminDashboard = '/company-admin-dashboard';
}

class AppRouter {
  static final GoRouter _router = GoRouter(
    // The app starts at the Portal Selection screen
    initialLocation: AppRoutes.portalSelection,
    debugLogDiagnostics: true,
    routes: [
      // ==========================================
      // Portal Selection (Entry Point)
      // ==========================================
      GoRoute(
        name: 'portal-selection',
        path: AppRoutes.portalSelection,
        builder: (context, state) => const AdminPortalSelection(),
      ),

      // ==========================================
      // Platform Admin Auth Flow
      // ==========================================
      GoRoute(
        name: 'sign-in',
        path: AppRoutes.signIn,
        builder: (context, state) => const SignIn(),
      ),
      GoRoute(
        name: 'sign-up',
        path: AppRoutes.signUp,
        builder: (context, state) => const SignUp(),
      ),
      GoRoute(
        name: 'verification',
        path: AppRoutes.verification,
        builder: (context, state) => const Verification(),
      ),
      GoRoute(
        name: 'forgot-password',
        path: AppRoutes.forgotPassword,
        builder: (context, state) => const ForgotPassword(),
      ),
      GoRoute(
        name: 'reset-password',
        path: AppRoutes.resetPassword,
        builder: (context, state) => const ResetPassword(),
      ),

      // ==========================================
      // Main Application Shell (Platform Admin)
      // ==========================================
      GoRoute(
        name: 'mainScreen',
        path: AppRoutes.mainScreen,
        builder: (context, state) => const MainShellScreen(),
      ),

      // ==========================================
      // Company Admin Flow
      // ==========================================
      GoRoute(
        name: 'company-admin-sign-in',
        path: AppRoutes.companyAdminSignIn,
        builder: (context, state) => const CompanyAdminLogin(),
      ),
      GoRoute(
        name: 'company-admin-dashboard',
        path: AppRoutes.companyAdminDashboard,
        builder: (context, state) => const CompanyAdminDashboard(),
      ),
    ],

    // ==========================================
    // Error Page (404)
    // ==========================================
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 64, color: Colors.red),
            const SizedBox(height: 16),
            const Text(
              'Oops! This page does not exist.',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => context.go(AppRoutes.portalSelection),
              child: const Text('Back to Portal Selection'),
            ),
          ],
        ),
      ),
    ),
  );

  static GoRouter get router => _router;
}