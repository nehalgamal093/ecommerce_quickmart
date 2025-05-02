import 'package:flutter/material.dart';

class OrderTrackingState extends ChangeNotifier {
  int index = 0;
  void changeTrackingState(int index) {
    this.index = index;
    notifyListeners();
  }
}
