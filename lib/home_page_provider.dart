import 'package:flutter/cupertino.dart';

class HomePageProvider extends ChangeNotifier{
 var age = 10;

 void changeAge(){
  age =25;
  notifyListeners();
 }
 static Future<String> fetchName()async{
  await Future.delayed(Duration(seconds:  2));
  return "Sudish kumar";
 }

 static Stream<int> getCounter(){
  return Stream.periodic(Duration(seconds: 3), (computationCount) => computationCount+1,);
 }
}

