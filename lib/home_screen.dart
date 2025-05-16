import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView.separated(
          separatorBuilder: (context, index) {
            return Container(height: 4, color: Colors.red,);
          },
          itemCount: 10,
          itemBuilder: (context, index) {
          return ListTile(
            title: Text("Title ${index+1}"),
            subtitle: Text("Sub title of ${index+1} "),
            trailing: Icon(Icons.add),
          );
        },),
      ),
    );
  }
}
