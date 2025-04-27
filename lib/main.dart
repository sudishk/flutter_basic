import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
void main(){
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var isSwitchOn = false;
  TextEditingController nameController = TextEditingController();
  String enteredName = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Switch(value: isSwitchOn, onChanged: (value) {
              isSwitchOn = value;
              setState(() {

              });
            },),
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
                Text("Sudish"),Text("Sudish"),
                Text("Sudish"),



              ],),
            Text("Sudish"),
            Text("Sudish"),
            Text("Sudish"),
            Text(enteredName, style: TextStyle(fontSize: 30),),
            Icon(Icons.person),
            TextField(controller: nameController, decoration: InputDecoration(hintText: "Enter name"),),
            // Image.network("src"),
            ElevatedButton(onPressed: () {
              var name = nameController.text.toString();
              enteredName = name;
              setState(() {

              });
              Fluttertoast.showToast(msg: "You have entered $name");
            }, child: Text("Click me"))

          ],
        ),
      ),
    );
  }
}
