
import 'package:flutter/material.dart';
import 'package:flutter_basic/show_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Form(
        key: formKey,
        child: Column(
          children: [
            TextFormField(controller: nameController, decoration: InputDecoration(hint: Text("Enter name")),validator: (value) {
              if(value!.isEmpty  ){
                var name ="please enter name".split("");
                var firstLetter = name[0].toUpperCase();
                var capitlizeName = "$firstLetter";
                for(int i=1; i<= name.length-1; i++){
                  capitlizeName = capitlizeName + name[i];
                }
                return capitlizeName;
              }
            },),  TextFormField(controller: emailController, decoration: InputDecoration(hint: Text("Enter name")),validator: (value) {
               bool emailValid =
              RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                  .hasMatch(value!);

              if(!emailValid  ){

                return "Please enter valid email";
              }
            },),

            ElevatedButton(onPressed: ()async {
              if(formKey.currentState!.validate()){
                // navigator
                var sharePreference =await SharedPreferences.getInstance(); // object created
                sharePreference.setString("name_key", nameController.text.toString()); // name stored in share preference
                sharePreference.setString("email_key", emailController.text.toString());// email stored in share preference
              }
            }, child: Text("Save changes")),

            ElevatedButton(onPressed: ()async {
             Navigator.push(context, MaterialPageRoute(builder: (context) => ShowData(),));
            }, child: Text("Show Data"))
          ],
        ),
      ),
    );
  }

}


// GlobalKey | Access widget from outside (like form validation)
// LocalKey | Base class (rare direct use)
// ValueKey | Identify widget based on some value (like ID)
// UniqueKey | Force widget to always be recreated uniquely
// ObjectKey | Identify widget based on an object