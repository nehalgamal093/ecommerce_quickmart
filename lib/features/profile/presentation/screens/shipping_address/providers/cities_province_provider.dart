import 'package:flutter/material.dart';

class CityProvinceProvider extends ChangeNotifier {
  String phone = "";
  String province = "";
  String city = "Ottawa";
  String street = "";
  void changeProvince(String province) {
    this.province = province;
    notifyListeners();
  }

  void changeCity(String city) {
    this.city = city;
    notifyListeners();
  }

  void changePhone(String phone) {
    this.phone = phone;
    notifyListeners();
  }

  void changeStreet(String street) {
    this.street = street;
    notifyListeners();
  }
}
