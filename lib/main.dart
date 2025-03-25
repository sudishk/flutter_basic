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
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: ListView(
          padding: EdgeInsets.only(top: 30),
            children: [

              Container(
                margin: EdgeInsets.all(20),
                height: 250,
                child:Row(
                  spacing: 100,
                  children: [
                    Text("Sudish"),
                    Text("Sudish"),
                  ],
                ) ,
                decoration: BoxDecoration(color: Colors.black12, borderRadius: BorderRadius.circular(30)),
              ),
              Container(
                margin: EdgeInsets.all(20),
                height: 250,
                child:Row(
                  spacing: 100,
                  children: [
                    Text("Sudish"),
                    Text("Sudish"),
                  ],
                ) ,
                decoration: BoxDecoration(color: Colors.black12, borderRadius: BorderRadius.circular(30)),
              ),
              Container(
                margin: EdgeInsets.all(20),
                height: 250,
                child:Row(
                  spacing: 100,
                  children: [
                    Text("Sudish"),
                    Text("Sudish"),
                  ],
                ) ,
                decoration: BoxDecoration(color: Colors.black12, borderRadius: BorderRadius.circular(30)),
              ),
              Container(
                margin: EdgeInsets.all(20),
                height: 250,
                child:Row(
                  spacing: 100,
                  children: [
                    Text("Sudish"),
                    Text("Sudish"),
                  ],
                ) ,
                decoration: BoxDecoration(color: Colors.black12, borderRadius: BorderRadius.circular(30)),
              ),
              Container(
                margin: EdgeInsets.all(20),
                height: 250,
                child:Row(
                  spacing: 100,
                  children: [
                    Text("Sudish"),
                    Text("Sudish"),
                  ],
                ) ,
                decoration: BoxDecoration(color: Colors.black12, borderRadius: BorderRadius.circular(30)),
              ),
              SizedBox(child: Icon(Icons.home),height: 100, width: 100,),
              Wrap(
                spacing: 100,

                children: [
                Text("Sudish"),
                Text("Sudish"),
                  Text("Sudish"),
                  Text("Sudish"),
                  Text("Sudish"),
                  Text("Sudish"),
                  Text("Sudish"),
                  Text("Sudish"),

                  Text("Sudish"),
                  Text("Sudish"),Text("Sudish"),
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
