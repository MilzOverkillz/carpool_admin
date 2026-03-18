import 'package:carpool_admin/screens/login_and_register_section/forgot_password.dart';
import 'package:carpool_admin/screens/login_and_register_section/reset_password.dart';
import 'package:carpool_admin/screens/login_and_register_section/sign_in.dart';
import 'package:carpool_admin/screens/login_and_register_section/sign_up.dart';
import 'package:carpool_admin/screens/login_and_register_section/verification.dart';
import 'package:carpool_admin/screens/main_dashboard_section/main_dashboard.dart';
import 'package:carpool_admin/screens/main_screen/main_shell_screen.dart';
import 'package:carpool_admin/screens/notifications_screen/notifications_content.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// Import screens
import 'package:carpool_admin/screens/User_Section/user_screen.dart';

abstract class AppRoutes {
  static const String signIn = '/';
  static const String signUp = '/sign-up';
  static const String verification = '/verification';
  static const String dashboard = '/dashboard';
  static const String payments = '/payments';
  static const String settings = '/settings';
  static const String forgotPassword = '/forgot-password';
  static const String resetPassword = '/reset-password';
  static const String users = '/users';
  static const String notifications = '/notifications';
  static const String mainScreen = '/mainScreen';
  // Added notifications route
}

class AppRouter {
  static final GoRouter _router = GoRouter(
    // Changed initial location to start directly on the Notifications screen for testing
    initialLocation: AppRoutes.mainScreen,
    debugLogDiagnostics: true,
    routes: [
      // Auth Flow
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
        name: 'mainScreen',
        path: AppRoutes.mainScreen,
        builder: (context, state) => const MainShellScreen(),
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

      // Users Flow
      GoRoute(
        name: 'users',
        path: AppRoutes.users,
        builder: (context, state) => const UserScreen(),
      ),

      // Notifications Flow (NEW)
      GoRoute(
        name: 'notifications',
        path: AppRoutes.notifications,
        builder: (context, state) => const NotificationsContent(),
      ),


      // Payments Overview
      GoRoute(
        path: AppRoutes.payments,
        builder: (context, state) =>
            const PlaceholderScreen(title: "Payments Overview"),
      ),
    ],

    // Error Page
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 64, color: Colors.red),
            const SizedBox(height: 16),
            const Text(
              'Oops! Page not found.',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => context.go(AppRoutes.signIn),
              child: const Text('Go to Home'),
            ),
          ],
        ),
      ),
    ),
  );

  static GoRouter get router => _router;
}

// Temporary Placeholder
class PlaceholderScreen extends StatelessWidget {
  final String title;
  const PlaceholderScreen({super.key, required this.title});
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text(title)),
    body: Center(child: Text(title)),
  );
}
