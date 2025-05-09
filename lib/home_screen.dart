import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var userNames = ["Akash kumar", "Vikash kumar", "Mohit Kumar","Akash kumar", "Vikash kumar", "Mohit Kumar"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:2,crossAxisSpacing: 10, mainAxisSpacing: 10,),
        itemCount: userNames.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(userNames[index]),
            ),
          );
      },),
    );
  }
}
