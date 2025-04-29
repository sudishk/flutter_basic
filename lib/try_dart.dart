// // // import 'dart:io';
// // // import 'package:flutter/material.dart';
// // //
// // //  abstract class MainWidget{
// // //   Widget build(){
// // //    return Container();
// // //   }
// // //  }
// // //
// // //  abstract class GlobalWidget{
// // //   void getDate();
// // //  }
// // //  class HomeScreen implements MainWidget, GlobalWidget{
// // //
// // //   double _width=10;
// // //
// // //   double get getWidth => _width;
// // //   void setWidth(double width){
// // //    _width = width;
// // //   }
// // //   @override
// // //   void getDate() {
// // //    print("07/04/2025");
// // //
// // //   }
// // //
// // //   @override
// // //   Widget build() {
// // //    return Container();
// // //   }
// // //
// // //
// // //
// // //
// // //  }
// //  // void main(){
// //  //  String? name = stdin.readLineSync();
// //  //  print("enter name is $name");
// //  //  var homeScreen= HomeScreen();
// //  //  print(homeScreen.build());
// //  //  homeScreen.getDate();
// //  // }
// //
// // // Dublicate value cheak
// // // void main()
// // // {
// // //  var list = [2,2,10,30,30,2, 2,2];
// // //  var len = list.length-1;
// // //  var dublicate = [];
// // //  for(int i = 0; i<=len; i++)
// // //  {
// // //   for(int j = i+1; j<=len; j++)
// // //   {
// // //    if(list[i]==list[j]) {
// // //     if(dublicate.contains(list[i])){
// // //      dublicate.add(list[i]);
// // //
// // //     }else {
// // //      dublicate.add(list[i]);
// // //      dublicate.add(list[i]);
// // //     }
// // //     break;
// // //    }
// // //   }
// // //  }
// // //  print(dublicate);
// // // }
// //
// // void main() {
// //   List<int> numbers = [1, 2, 2, 3, 4, 4, 5, 6, 6,1, 6,6,6,6,6,6,6,6,6,66,6,6,];
// //   List<int> dummyData = [];
// //
// //   for (int i = 0; i < numbers.length; i++)
// //   {
// //     int count = 0;
// //     for (int j = 0; j < numbers.length; j++)
// //     {
// //       if (numbers[i] == numbers[j])
// //       {
// //         count++;
// //       }
// //     }
// //     if (count > 1) {
// //       if(dummyData.contains(numbers[i])){
// //
// //       }else{
// //         print('${numbers[i]} is duplicate with count $count');
// //         dummyData.add(numbers[i]);
// //       }
// //     }
// //   }
// //
// // }
// // void main(){
// // var name = "Ram";
// // var nameletter = "";
// //
// // for(int index=0; index<name.length; index++){
// //   nameletter=nameletter+name[index];
// //   print(nameletter);
// // }
// // }
//
//
// void main(){
//   var home = Village(name: "Ram Awas", age: 20);
//   var namedHome = Home.instance("Abc");
//   print( home.name);
//   home.cleaning();
// }
//
// class Home{
//   final String name;
//   int _age = 0;
//   int get getAge => _age;
//   set setAge(int age)  {
//     _age = age;
//   }
//   Home({required this.name} );
//   Home.instance(this.name);
//   void cleaning(){
//     _age = 20;
//      print(name);
//   }
// }
//
// class MyWorld extends Home{
//   MyWorld({required super.name, required super.age});
//
//   @override
//   void cleaning() {
//     print("My world is cleaning");
//     // super.cleaning();
//   }
// }
// class Mannat extends Home {
//   Mannat({required super.name, required super.age});
//
// }
// abstract class Village extends MyWorld{
//   Village({required super.name, required super.age});
//
//   void painting();
// }
//
//
// class VillageHome implements Village, Mannat {
//
//   @override
//   void painting() {
//   }
//
//   @override
//   void cleaning() {
//     // TODO: implement cleaning
//   }
//
//   @override
//   // TODO: implement getAge
//   int get getAge => throw UnimplementedError();
//
//   @override
//   set setAge(int age) {
//     // TODO: implement setAge
//   }
//
//   @override
//   int _age;
//
//   @override
//   // TODO: implement name
//   String get name => throw UnimplementedError();
// }

// void main(){
//
//   // 0
//   // 1
//   // 0+1 = 1
//   // 1+1 = 2
//   // 1+2 = 3
//   // 2+3 = 5
//   // 3+5 = 8
//   // 5+8 = 13
//   // 8+13
//   var prev = 0;
//   var current = 1;
//   print(prev);
//   print(current);
//   for (int a = 0; a<15 ; a++){
//     int c = prev + current;
//     print(c);
//     prev = current;
//     current = c;
//
//   }
//   }








//
// void main(){
//   var a=1;
//    var prev =0;
//    var current = 1;
//    print(prev);
//    print(current);
//    do{
//      var b= current+prev;
//      print(b);
//      prev = current;
//      current = b;
//      a++;
//    }while(a<=10);
//
//    }

void main(){
   // getName().then((name) {
   //   // print(name);
   // },);
   startCounter1().listen((event) {
      print(event);
   },);

}


Future<String>  getName()async{
 var name = await Future.delayed(Duration(seconds: 5), () {
    return "Sudish";
  },);
 print(name);
print("Not wait");
 return name;
}
Stream<int> startCounter1(){
  return Stream.periodic(Duration(seconds: 1),(computationCount) => computationCount +5,);
}






