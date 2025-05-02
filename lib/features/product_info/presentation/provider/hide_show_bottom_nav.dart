import 'package:flutter/material.dart';

class HideShowBottomNavProvider extends ChangeNotifier {
  bool visible = true;

  void show() {
    visible = true;
    notifyListeners();
  }

  void hide() {
    visible = false;
    notifyListeners();
  }
}
