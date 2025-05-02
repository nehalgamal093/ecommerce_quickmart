import 'package:flutter/cupertino.dart';

class AddressRadioProvider extends ChangeNotifier {
  String status = 'Manual';

  void changeManual(String status) {
    this.status = status;
    notifyListeners();
  }
}
