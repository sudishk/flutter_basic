import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basic/auth_helper.dart';

class AuthProvider with ChangeNotifier{

  var emailController= TextEditingController();
  var passwordController= TextEditingController();
  var firstNameController= TextEditingController();
  var lastNameController= TextEditingController();
  var numberController= TextEditingController();
  var addressController= TextEditingController();
  var genderController= TextEditingController();

  loginNow(BuildContext context)async{
    var data = {
      "email" : emailController.text,
      "password": passwordController.text
    };
    var res =await AuthHelper.login(data);
    if(res != null){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Login successfully")));
    }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Login failed")));

    }
  }

}