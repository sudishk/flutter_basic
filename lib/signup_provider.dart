import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignupProvider with ChangeNotifier {
  bool obscureText = true;
  var nameController = TextEditingController();
  var passController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  signup(BuildContext context)async{
    try {
      var
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Signup successfully")));
    }catch(error) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Signup failed $error")));

    }
  }
  showOrHidePassword(){
    obscureText = !obscureText;
    notifyListeners();
  }
}