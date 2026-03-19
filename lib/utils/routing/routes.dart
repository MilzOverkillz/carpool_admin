import 'package:carpool_admin/screens/login_and_register_section/forgot_password.dart';
import 'package:carpool_admin/screens/login_and_register_section/reset_password.dart';
import 'package:carpool_admin/screens/login_and_register_section/sign_in.dart';
import 'package:carpool_admin/screens/login_and_register_section/sign_up.dart';
import 'package:carpool_admin/screens/login_and_register_section/verification.dart';
import 'package:carpool_admin/screens/main_screen/main_shell_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract class AppRoutes {
  static const String signIn = '/';
  static const String signUp = '/sign-up';
  static const String verification = '/verification';
  static const String forgotPassword = '/forgot-password';
  static const String resetPassword = '/reset-password';
  
  // This is now the ONLY route you need for the inside of the app!
  static const String mainScreen = '/mainScreen';
}

class AppRouter {
  static final GoRouter _router = GoRouter(
    // Start directly on the MainShellScreen
    initialLocation: AppRoutes.mainScreen,
    debugLogDiagnostics: true,
    routes: [
      // ==========================================
      // Auth Flow
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
      // Main App Shell (Handles all internal screens)
      // ==========================================
      GoRoute(
        name: 'mainScreen',
        path: AppRoutes.mainScreen,
        builder: (context, state) => const MainShellScreen(),
      ),
    ],

    // ==========================================
    // Error Page
    // ==========================================
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