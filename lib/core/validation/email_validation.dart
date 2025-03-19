import 'dart:async';
import 'package:ecommerce_shop/core/validation/validation/validation.dart';

class EmailValidation extends Validation {
  final StreamController<String> _errorEmailController =
      StreamController<String>.broadcast();

  @override
  Stream<String> get errorStream => _errorEmailController.stream;

  @override
  void validate(String value) {
    if (emptyText(value)) {
      _errorEmailController.add('Email required');
    } else if (!isEmailValid(value)) {
      _errorEmailController.add('Invalid Email');
    } else {
      _errorEmailController.add('');
    }
  }

  @override
  void dispose() {
    _errorEmailController.close();
  }
}
