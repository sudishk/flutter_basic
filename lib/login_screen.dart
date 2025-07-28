import 'package:flutter/material.dart';
import 'package:flutter_basic/profile_screen.dart';
import 'package:flutter_basic/signup_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
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
                    onPressed: () => Navigator.pop(context),
                  ),
                  const Spacer(),
                ],
              ),
              const SizedBox(height: 10),
              Center(
                child: Column(
                  children: [
                    Image.asset(
                      'assets/salespro_logo.png',
                      height: 80,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Sign In",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
              const SizedBox(height: 10),

              // Email TextField
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.email_outlined),
                  hintText: "Email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Password TextField
              TextField(
                controller: passController,
                obscureText: _obscurePassword,
                decoration: InputDecoration(
                  hintText: "Password",
                  prefixIcon: const Icon(Icons.lock_outline),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 8),

              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Forgot Password?",
                    style: TextStyle(color: Colors.black87),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              ElevatedButton(
                onPressed: () async {
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
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[700],
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text(
                  "Log In",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),

              const SizedBox(height: 20),

              Row(
                children: const [
                  Expanded(child: Divider()),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text("Or Login with"),
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
                    // Navigate to register
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen(),));

                  },
                  child: const Text.rich(
                    TextSpan(
                      text: "Haven’t any account? ",
                      children: [
                        TextSpan(
                          text: "Register",
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
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
