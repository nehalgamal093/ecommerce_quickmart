import 'dart:async';

abstract class Validation {
  Stream<String> get errorStream;
  bool emptyText(String text) {
    if (text.isEmpty) {
      return true;
    }
    return false;
  }

  bool longText(String text) {
    if (text.length < 8) {
      return false;
    }
    return true;
  }

  bool isEmailValid(String email) {
    final RegExp regex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    return regex.hasMatch(email);
  }

  bool isTextLong(String value) {
    if (value.length < 8) {
      return false;
    }
    return true;
  }

  bool hasUpperCase(String value) {
    for (int i = 0; i < value.length; i++) {
      if (value[i].contains(RegExp(r'[A-Z]'))) {
        return true;
      }
    }
    return false;
  }

  bool hasNumbers(String value) {
    for (int i = 0; i < value.length; i++) {
      if (value[i].contains(RegExp(r'[1-2]'))) {
        return true;
      }
    }
    return false;
  }

  bool hasLowerCase(String value) {
    for (int i = 0; i < value.length; i++) {
      if (value[i].contains(RegExp(r'[a-z]'))) {
        return true;
      }
    }
    return false;
  }

  bool hasSpecialCharacter(String value) {
    final specialCharRegex = RegExp(r'[!@#$%^&*]');
    return specialCharRegex.hasMatch(value);
  }

  void validate(String value);
  void dispose();
}
