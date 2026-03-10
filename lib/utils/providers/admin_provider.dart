import 'package:flutter/material.dart';

class AdminProvider extends ChangeNotifier {
  String _currentAdminName = "Hansika Hettiarachchi";
  String _currentAdminEmail = "knightowl@gmail.com";

  String get adminName => _currentAdminName;
  String get adminEmail => _currentAdminEmail;

  void updateAdminProfile(String name, String email) {
    _currentAdminName = name;
    _currentAdminEmail = email;
    notifyListeners();
  }
}