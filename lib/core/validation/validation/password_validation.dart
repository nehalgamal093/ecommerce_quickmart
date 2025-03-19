import 'dart:async';
import 'package:ecommerce_shop/core/validation/validation/validation.dart';

class PasswordValidation extends Validation {
  final StreamController<String> _errorPasswordController =
      StreamController<String>.broadcast();

  @override
  Stream<String> get errorStream => _errorPasswordController.stream;

  @override
  void validate(String value) {
    if(!hasUpperCase(value)){
      _errorPasswordController.add('Password should contain uppercase letter');
    } else if(!hasLowerCase(value)){
      _errorPasswordController.add('Password should contain lower letter');
    }else if(!hasNumbers(value)){
      _errorPasswordController.add('Password should contain numbers');
    } else if(!hasSpecialCharacter(value)){
      _errorPasswordController.add('Password should contain @#\$%^&*');
    }else if(!longText(value)){
      _errorPasswordController.add('Password should contain 8 characters');
    } else {
      _errorPasswordController.add('');
    }
  }

  @override
  void dispose() {
    _errorPasswordController.close();
  }
}
