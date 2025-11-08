import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_model/login_viewmodel.dart';

class LoginPage extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<LoginViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            vm.isLoading
                ? CircularProgressIndicator()
                : ElevatedButton(
              onPressed: () {
                vm.login(
                  emailController.text.trim(),
                  passwordController.text.trim(),
                );
              },
              child: Text('Login'),
            ),
            const SizedBox(height: 20),
            if (vm.errorMessage != null)
              Text(vm.errorMessage!,
                  style: TextStyle(color: Colors.red, fontSize: 16)),
            if (vm.user != null)
              Text("Welcome, ${vm.user!.email}",
                  style: TextStyle(color: Colors.green, fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
