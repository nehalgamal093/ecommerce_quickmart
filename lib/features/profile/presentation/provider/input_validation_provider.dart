import 'dart:async';

import 'package:ecommerce_shop/features/auth/presentation/screen/import_files/import_files.dart';

class InputValidationProvider extends ChangeNotifier {
  String fullName = "";
  String phoneNumber = "";
  String city = "";
  String state = "";
  String streetAddress = "";
  String postalCode = "";
  String errorFullName = "";
  StreamController<String> fullNameStreamController =
      StreamController<String>.broadcast();

  String errorPhoneNumber = "";
  StreamController<String> phoneNumberStreamController =
      StreamController<String>.broadcast();
  String errorPostalCode = "";
  StreamController<String> postalCodeStreamController =
      StreamController<String>.broadcast();

  String errorStreetAddress = "";
  StreamController<String> streetAddressStreamController =
      StreamController<String>.broadcast();

  String errorState = "";
  StreamController<String> stateStreamController =
      StreamController<String>.broadcast();

  String errorCity = "";
  StreamController<String> cityStreamController =
      StreamController<String>.broadcast();
  void isFullNameValid() {
    fullNameStreamController.add(fullName);
    fullNameStreamController.stream.listen((val) {
      if (val.isEmpty || fullName.isEmpty) {
        errorFullName = "*FullName Required";
      } else {
        errorFullName = "";
      }
      notifyListeners();
    });
  }

  void isPhoneNumberValid() {
    phoneNumberStreamController.add(phoneNumber);
    phoneNumberStreamController.stream.listen((val) {
      if (val.isEmpty || phoneNumber.isEmpty) {
        errorPhoneNumber = "*Phone number Required";
      } else {
        errorPhoneNumber = "";
      }
      notifyListeners();
    });
  }

  void isPostalCodeValid() {
    postalCodeStreamController.add(postalCode);
    postalCodeStreamController.stream.listen((val) {
      if (val.isEmpty || postalCode.isEmpty) {
        errorPostalCode = "*Postal Code Required";
      } else {
        errorPostalCode = "";
      }
      notifyListeners();
    });
  }

  void isStreetAddressValid() {
    streetAddressStreamController.add(streetAddress);
    streetAddressStreamController.stream.listen((val) {
      if (val.isEmpty || streetAddress.isEmpty) {
        errorStreetAddress = "*Street Address Required";
      } else {
        errorStreetAddress = "";
      }
      notifyListeners();
    });
  }

  void isStateValid() {
    stateStreamController.add(state);
    stateStreamController.stream.listen((val) {
      if (val.isEmpty || state.isEmpty) {
        errorState = "*State Required";
      } else {
        errorState = "";
      }
      notifyListeners();
    });
  }

  void isCityValid() {
    cityStreamController.add(city);
    cityStreamController.stream.listen((val) {
      if (val.isEmpty || city.isEmpty) {
        errorCity = "*City Required";
      } else {
        errorCity = "";
      }
      notifyListeners();
    });
  }

  void validateInputs() {
    isFullNameValid();
    isPhoneNumberValid();
    isStreetAddressValid();
    isPostalCodeValid();
    isStateValid();
    isCityValid();
  }
}
