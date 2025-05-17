import 'package:flutter/material.dart';
import 'package:flutter_basic/product_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration( hintText: "Enter name", border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15)))),),
            ElevatedButton(onPressed: () async{
            var result =  await Navigator.push(context, MaterialPageRoute(builder: (context) => ProductScreen(name: nameController.text,),));
            if(result != "" && result != null){
              nameController.text = result;
              setState(() {

              });
            }
            }, child: Text("Go to Product Screen ")),
          ],
        ),
      ),
    );
  }
}
