import 'package:flutter/material.dart';
import 'package:flutter_basic/profile_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginProvider with ChangeNotifier {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  bool obscurePassword = true;

  void login(BuildContext context)async{
    // Your login logic here
    var sharePreference =await SharedPreferences.getInstance(); // object created
    var email= sharePreference.getString("email_key");
    var pass= sharePreference.getString("pass_key");
    print(email);
    print(pass);
    print(emailController.text.toString());
    print(passController.text.toString());
    if(email == emailController.text.toString() && pass == passController.text.toString()){
      sharePreference.setBool("login_status_key", true);
      Navigator.push(context, MaterialPageRoute(builder: (context) =>ProfileScreen() ,));
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Login successfully")));

    }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Login failed")));
    }
  }

  updatePasswordShowHide(){
    obscurePassword = !obscurePassword;
    notifyListeners();
  }
}