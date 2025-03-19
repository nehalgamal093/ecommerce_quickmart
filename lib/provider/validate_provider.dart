import 'package:ecommerce_shop/core/validation/email_validation.dart';
import 'package:ecommerce_shop/core/validation/validation/password_validation.dart';
import 'package:flutter/material.dart';

class ValidateProvider extends ChangeNotifier {
  final EmailValidation _emailValidation = EmailValidation();
  final PasswordValidation _passwordValidation = PasswordValidation();
  String errorEmailText = "";
  String errorPasswordText = "";
  bool isValid =false;
  bool isEmailValid = false;
  bool isPasswordValid = false;

  void areInputsValid(){
   isValid = isEmailValid &&isPasswordValid;
   notifyListeners();
  }
  void validateEmail(String value) {
    _emailValidation.validate(value);
    _emailValidation.errorStream.listen((error) {
      areInputsValid();
      errorEmailText = error;
      if(error.isEmpty){
        isEmailValid=true;
      }
      notifyListeners();
    });
  }
  void validatePassword(String value) {
    _passwordValidation.validate(value);
    _passwordValidation.errorStream.listen((error) {
      areInputsValid();
      errorPasswordText = error;
      if(error.isEmpty){
        isPasswordValid=true;
      }
      notifyListeners();
    });
  }
}
