
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var nameController =TextEditingController();
  var emailController =TextEditingController();
  var formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Form(
              key: formkey,
              child: Column(
            children: [
              TextFormField(controller:nameController , decoration: InputDecoration(hintText: "Enter name"), validator: (value) {
                if(value!.isEmpty){
                  return "Enter name";
                }
              },),

              TextFormField(controller:emailController , decoration: InputDecoration(hintText: "Enter email"), validator: (value) {
                if(value!.isEmpty){
                  return "Enter email";K
                }else if(!value.contains("@gmail.com")){
                  return "Enter valid email";
                }
                return null;
              },),

              ElevatedButton(onPressed: () {
                if(formkey.currentState!.validate()){
                  // send to home page
                }
              }, child: Text("Submit"))
            ],
          ))
        ],
      ),
    );
  }
}










// GlobalKey | Access widget from outside (like form validation)
// LocalKey | Base class (rare direct use)
// ValueKey | Identify widget based on some value (like ID)
// UniqueKey | Force widget to always be recreated uniquely
// ObjectKey | Identify widget based on an object