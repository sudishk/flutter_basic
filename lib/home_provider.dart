import 'package:flutter/cupertino.dart';

class HomeProvider with ChangeNotifier{
  var message = "Hello";
  updateMessage(){
    message = "Hi your page is refreshed";
   notifyListeners();
  }
}