import 'package:flutter/material.dart';
import 'package:flutter_basic/product_screen.dart';
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
        body: ElevatedButton(onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => ProductScreen(),));
        }, child: Text("Go to Product Screen ")),
      ),
    );
  }
}
