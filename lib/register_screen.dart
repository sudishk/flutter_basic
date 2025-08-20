import 'package:flutter/material.dart';
import 'package:flutter_basic/auth_provider.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AuthProvider>(context,listen: false);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Register"),
        ),
        body: Column(
          children: [
            TextField(controller: provider.emailController, decoration: InputDecoration(hintText: "first_name"),),
            TextField(controller: provider.passwordController, decoration: InputDecoration(hintText: "last_name"),),
            TextField(controller: provider.descriptionController, decoration: InputDecoration(hintText: "email"),),
            TextField(controller: provider.categoryController, decoration: InputDecoration(hintText: "gender"),),
            TextField(controller: provider.imageController, decoration: InputDecoration(hintText: "number"),),
            ElevatedButton(onPressed: () {

            }, child: Text("Register now"))
          ],
        ),
      ),
    );
  }
}
