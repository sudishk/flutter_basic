import 'package:flutter/material.dart';
import 'package:flutter_basic/profile_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  String name = "";
  String email = "";
  bool obscurePassword = true;

  void login(BuildContext context)async{
    var sharePreference =await SharedPreferences.getInstance(); // object created
    var email= sharePreference.getString("email_key");
    var pass= sharePreference.getString("password_key");
    if(email == emailController.text.toString() && pass == passController.text.toString()){
      sharePreference.setBool("login_status_key", true);
      Navigator.push(context, MaterialPageRoute(builder: (context) =>ProfileScreen() ,));
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Login successfully")));

    }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Login failed")));
    }
  }
  signup(BuildContext context)async{
    try {
      var sharePreference = await SharedPreferences
          .getInstance(); // object created
      await sharePreference.setString("name_key", nameController.text
          .toString()); // name stored in share preference
      await sharePreference.setString("email_key", emailController.text
          .toString()); // email stored in share
      await sharePreference.setString(
          "pass_key", passController.text.toString());
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Signup successfully")));
    }catch(error) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Signup failed $error")));

    }
  }
  updatePasswordShowHide(){
    obscurePassword = !obscurePassword;
    notifyListeners();
  }



  getData() async {
    var sharePreference = await SharedPreferences
        .getInstance(); // object created
    name = sharePreference.getString("name_key").toString();
    email = sharePreference.getString("email_key").toString();
    notifyListeners();
  }
}