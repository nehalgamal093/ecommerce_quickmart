import 'package:flutter/material.dart';

class OrderTrackingState extends ChangeNotifier {
  int index = 0;
  void changeTrackingState() {
    if(index<2){
      index++;
    }
    notifyListeners();
  }
  void stepCancel() {
    if(index>0){
      index--;
    }
    notifyListeners();
  }
}
