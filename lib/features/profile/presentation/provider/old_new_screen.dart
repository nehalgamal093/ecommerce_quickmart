import 'package:flutter/cupertino.dart';

class OldNewScreen extends ChangeNotifier {
  int index = 0;
  void changeScreen(int index) {
    this.index = index;
    notifyListeners();
  }
}
