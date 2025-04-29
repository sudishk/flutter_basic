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
    var formKey = GlobalKey<FormState>();
    var nameController = TextEditingController();
    var emailController = TextEditingController();
    return Scaffold(
      body: Container(
        child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(hintText: "Enter name"),validator: (value) {
                  if(value == null ||  value.isEmpty){
                    return "Enter name";
                  }
                  return null;
                },),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(hintText: "Enter email"),validator: (value) {
                  if(value == null ||  value.isEmpty){
                    return "Enter email";
                  }
                  return null;
                },),

                ElevatedButton(onPressed: () {
                  if(formKey.currentState!.validate()){
                    Fluttertoast.showToast(msg: "User name is ${nameController.text}");
                  }
                }, child: Text("Submit"))
              ],
            )),),
    );
  }
}

// GlobalKey | Access widget from outside (like form validation)
// LocalKey | Base class (rare direct use)
// ValueKey | Identify widget based on some value (like ID)
// UniqueKey | Force widget to always be recreated uniquely
// ObjectKey | Identify widget based on an object