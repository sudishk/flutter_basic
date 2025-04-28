import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(child: ElevatedButton(onPressed: () {
        showModalBottomSheet(context: context, builder: (context) {
          return Container(
            child: Column(
              children: [
                TextField(decoration: InputDecoration(hintText: "Enter name"),),
                TextField(decoration: InputDecoration(hintText: "Enter email")),
                ElevatedButton(onPressed: () {

                }, child: Text("Submit"))
              ],
            ),
          );
        },);
      }, child: Text("Open BottomSheet")),),
    );
  }
}
