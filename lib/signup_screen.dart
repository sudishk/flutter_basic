


// GlobalKey | Access widget from outside (like form validation)
// LocalKey | Base class (rare direct use)
// ValueKey | Identify widget based on some value (like ID)
// UniqueKey | Force widget to always be recreated uniquely
// ObjectKey | Identify widget based on an object


import 'package:flutter/material.dart';
import 'package:flutter_basic/signup_provider.dart';
import 'package:provider/provider.dart';

import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {


  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SignupProvider>(context, listen: false);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: ListView(
            children: [
              const SizedBox(height: 20),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const Spacer(),
                ],
              ),
              const SizedBox(height: 10),
              Center(
                child: Column(
                  children: [
                    Image.asset(
                      'assets/logo.png',
                      height: 80,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Sign Up",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
              _buildTextField("Company & Business Name", provider.nameController),
              _buildTextField("Email Address", provider.emailController),
              _buildTextField("Phone Number",provider.phoneController ),
              _buildPasswordField(provider.passController),

              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  provider.signup(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[700],
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                child: const Text(
                  "Register",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),

              const SizedBox(height: 20),
              Row(
                children: const [
                  Expanded(child: Divider()),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text("Or Register with"),
                  ),
                  Expanded(child: Divider()),
                ],
              ),
              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildSocialIcon("assets/facebook.png"),
                  _buildSocialIcon("assets/google.png"),
                  _buildSocialIcon("assets/twitter.png"),
                ],
              ),

              const SizedBox(height: 30),
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
                  },
                  child: const Text.rich(
                    TextSpan(
                      text: "Already have an account? ",
                      children: [
                        TextSpan(
                          text: "Log In",
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
      ),
    );
  }

  Widget _buildPasswordField(TextEditingController controller,) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Consumer<SignupProvider>(
        builder: (context, provider, child) {
          return TextField(
            controller: controller,
            obscureText:  provider.obscureText,
            decoration: InputDecoration(
              labelText: "Password",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  provider.obscureText ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: () {
                  provider.showOrHidePassword();
                },
              ),
            ),
          );
        },

      ),
    );
  }

  Widget _buildSocialIcon(String path) {
    return CircleAvatar(
      radius: 24,
      backgroundColor: Colors.grey[200],
      child: Image.asset(
        path,
        height: 24,
        width: 24,
      ),
    );
  }
}
