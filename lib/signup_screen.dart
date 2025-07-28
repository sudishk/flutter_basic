
import 'package:flutter/material.dart';
import 'package:flutter_basic/login_screen.dart';
import 'package:flutter_basic/profile_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var nameController = TextEditingController();
  var passController = TextEditingController();
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
                return "Please enter name";
              }
            },),

            TextFormField(controller: emailController, decoration: InputDecoration(hint: Text("Enter name")),validator: (value) {
               bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                  .hasMatch(value!);

              if(!emailValid ){

                return "Please enter valid email";
              }
            },),

            TextFormField(controller: passController, decoration: InputDecoration(hint: Text("Enter Password")),validator: (value) {
              if(value!.isEmpty  ){
                return "Please enter password";
              }
            },),

            ElevatedButton(onPressed: ()async {
              if(formKey.currentState!.validate()){
                // navigator
                var sharePreference =await SharedPreferences.getInstance(); // object created
                sharePreference.setString("name_key", nameController.text.toString()); // name stored in share preference
                sharePreference.setString("email_key", emailController.text.toString());// email stored in share
                sharePreference.setString("pass_key", passController.text.toString());

              }
            }, child: Text("Register")),

            ElevatedButton(onPressed: ()async {
              var sharePreference =await SharedPreferences.getInstance(); // object created
              var email= sharePreference.getString("email_key");
              var pass= sharePreference.getString("pass_key");
              sharePreference.setBool("login_status_key", true);

              if(email == emailController.text.toString() && pass == passController.text.toString()){
                Navigator.push(context, MaterialPageRoute(builder: (context) =>ProfileScreen() ,));
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Login successfully")));

              }else{
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Login failed")));
              }

            }, child: Text("Login now"))
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


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _obscureText = true;
  var nameController = TextEditingController();
  var passController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var formKey = GlobalKey<FormState>();

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
              _buildTextField("Company & Business Name", nameController),
              _buildTextField("Email Address", emailController),
              _buildTextField("Phone Number",phoneController ),
              _buildPasswordField(passController),

              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
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

  Widget _buildPasswordField(TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextField(
        controller: controller,
        obscureText: _obscureText,
        decoration: InputDecoration(
          labelText: "Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
          ),
          suffixIcon: IconButton(
            icon: Icon(
              _obscureText ? Icons.visibility_off : Icons.visibility,
            ),
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
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
