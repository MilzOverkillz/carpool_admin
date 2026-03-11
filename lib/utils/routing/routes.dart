import 'package:carpool_admin/screens/login_and_register_section/sign_in.dart';
import 'package:carpool_admin/screens/login_and_register_section/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// Placeholder imports - replace these with your actual new file paths
// import '../../screens/auth/login_page.dart';
// import '../../screens/dashboard/payments_dashboard.dart';

abstract class AppRoutes {
  static const String signIn = '/';
  static const String  signUp = '/sign-up';
  static const String dashboard = '/dashboard';
  static const String payments = '/payments';
  static const String settings = '/settings';
}

class AppRouter {
  static final GoRouter _router = GoRouter(
    initialLocation: AppRoutes.signIn,
    debugLogDiagnostics: true,
    routes: [
      // Auth Flow
      GoRoute(
        path: AppRoutes.signIn,
        builder: (context, state) => const SignIn(),
      ),
      GoRoute(
        path: AppRoutes.signIn,
        builder: (context, state) => const SignUp(),
      ),

      // Dashboard Flow
      GoRoute(
        path: AppRoutes.dashboard,
        builder: (context, state) => const PlaceholderScreen(title: "Main Dashboard"),
      ),

      // Payments Overview (The screen in your screenshot)
      GoRoute(
        path: AppRoutes.payments,
        builder: (context, state) => const PlaceholderScreen(title: "Payments Overview"),
      ),
    ],
    
    // Error Page (matching your existing design preference)
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 64, color: Colors.red),
            const SizedBox(height: 16),
            const Text('Oops! Page not found.', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
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
  Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: Text(title)), body: Center(child: Text(title)));
}