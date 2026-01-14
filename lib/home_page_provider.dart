import 'package:flutter/material.dart';

class HomePageProvider extends ChangeNotifier{
  var data = "";

  void changeData(){
    data = "Data changed";
    notifyListeners();
  }
}