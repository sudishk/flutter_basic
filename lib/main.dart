import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 50,
            children: [
              Row(
                spacing: 100,
                children: [
                  Text("Sudish"),
                  Text("Sudish"),
                ],
              ),
              Row(
                spacing: 100,

                children: [
                Text("Sudish"),
                Text("Sudish"),
              ],),

              Text("Sudish"),
              Text("Sudish"),
              Text("Sudish"),
              Text("Sudish"),
              Icon(Icons.person),
              TextField(decoration: InputDecoration(hintText: "Enter name"),),
              // Image.network("src"),
              ElevatedButton(onPressed: () {

              }, child: Text("Click me"))

            ],
          ),
        ),
      ),
    );
  }
}
