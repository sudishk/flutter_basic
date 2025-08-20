import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'auth_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AuthProvider>(context,listen: false);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Login"),
        ),
        body: Column(
          children: [
            TextField(controller: provider.emailController, decoration: InputDecoration(hintText: "Email"),),
            TextField(controller: provider.passwordController, decoration: InputDecoration(hintText: "pass"),),

            ElevatedButton(onPressed: () {
              provider.loginNow(context);
            }, child: Text("Login"))
          ],
        ),
      ),
    );
  }
}
