import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  bool _isAuthenticated = false;
  String? _adminEmail;

  bool get isAuthenticated => _isAuthenticated;
  String? get adminEmail => _adminEmail;

  // Logic to verify credentials (matches your Sign Up screen intent)
  void login(String email, String password) {
    if (email.isNotEmpty && password.length >= 6) {
      _isAuthenticated = true;
      _adminEmail = email;
      notifyListeners();
    }
  }

  void logout() {
    _isAuthenticated = false;
    _adminEmail = null;
    notifyListeners();
  }
}

/// This replaces your AuthLoggingStatus function. 
/// It acts as a "Gate" that sits at the root of your app.
class AuthGate extends StatelessWidget {
  final Widget authenticatedRoute;
  final Widget unauthenticatedRoute;

  const AuthGate({
    super.key, 
    required this.authenticatedRoute, 
    required this.unauthenticatedRoute
  });

  @override
  Widget build(BuildContext context) {
    // Note: You'll need to wrap your app in a ChangeNotifierProvider (see main.dart below)
    final auth =  _getAuthStatus(context); 
    return auth ? authenticatedRoute : unauthenticatedRoute;
  }

  bool _getAuthStatus(BuildContext context) {
    // Temporary helper logic until Provider is fully linked in main.dart
    return false; 
  }
}