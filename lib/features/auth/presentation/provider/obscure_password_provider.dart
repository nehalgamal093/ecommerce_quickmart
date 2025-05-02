import 'package:flutter/material.dart';

class ObscurePasswordProvider extends ChangeNotifier {
  bool isSecured = true;
  bool isOldSecured = true;
  bool isNewSecured = true;
  bool isConfirmSecured = true;
  void changeSecurePassword() {
    isSecured = !isSecured;
    notifyListeners();
  }

  void changeOldSecurePassword() {
    isOldSecured = !isOldSecured;
    notifyListeners();
  }

  void changeNewSecurePassword() {
    isNewSecured = !isNewSecured;
    notifyListeners();
  }

  void changeSecureConfirmPassword() {
    isConfirmSecured = !isConfirmSecured;
    notifyListeners();
  }
}
