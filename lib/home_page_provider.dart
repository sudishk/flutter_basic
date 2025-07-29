import 'package:flutter/cupertino.dart';

class HomePageProvider extends ChangeNotifier{
 var age = 10;

 void changeAge(){
  age =25;
  notifyListeners();
 }
 static Future<GetNameModel> fetchName()async{
  await Future.delayed(Duration(seconds:  2));
  return GetNameModel(name:  "Sudish kumar");
 }

 static Stream<int> getCounter(){
  return Stream.periodic(Duration(seconds: 3), (computationCount) => computationCount-5,);
 }
}


class GetNameModel{
 final String name;
 GetNameModel({required this.name});
}