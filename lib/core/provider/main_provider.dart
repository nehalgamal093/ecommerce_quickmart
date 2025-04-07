import 'package:flutter/cupertino.dart';

class MainProvider extends ChangeNotifier{
  int index = 0;

  void changeIndex(int index){
    this.index = index;
    notifyListeners();
  }
}