
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});


  Future<void> signInWithGoogle(BuildContext context) async {
    try {


      final GoogleSignInAccount googleAuth = await GoogleSignIn.instance.authenticate();
      print(googleAuth.email);
      print(googleAuth.displayName);


      // ✅ Success message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Google Sign-In successful")),
      );

      // ✅ Navigate to Profile Setup Screen
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(builder: (_) => const ProfileSetupScreen()),
      // );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Google Sign-In failed: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/image/couple_background.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(color: Colors.black.withOpacity(0.45)),
          Positioned(
            top: 50,
            left: 10,
            child: IconButton(
              onPressed: () {
                // Navigator.pushReplacement(
                //   context,
                //   MaterialPageRoute(builder: (_) => const OnBoardingScreen()),
                // )

              },
              icon: const Icon(Icons.arrow_back_ios_new,
                  size: 28, color: Colors.white),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  children: [
                    Container(
                      height: 110,
                      width: 110,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(color: Colors.black26, blurRadius: 20)
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset("assets/image/kt image.jpg",
                            fit: BoxFit.cover),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text("𝐖𝐞𝐥𝐜𝐨𝐦𝐞 𝐭𝐨 𝐀𝐟𝐭𝐞𝐫 𝐋𝐢𝐟𝐞",
                        style: TextStyle(fontSize: 16, color: Colors.white)),
                    const Text(
                      "𝐃𝐀𝐓𝐄 𝐖𝐈𝐓𝐇 𝐂𝐋𝐀𝐒𝐒",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 30),
                    fieldLabel("𝐄𝐦𝐚𝐢𝐥/𝐏𝐡𝐨𝐧𝐞"),
                    customField(),
                    const SizedBox(height: 20),
                    fieldLabel("𝐏𝐚𝐬𝐬𝐰𝐨𝐫𝐝"),
                    customField(obscure: true),
                    const SizedBox(height: 25),
                    ElevatedButton(
                      onPressed: (){
                        // Navigator.pushReplacement(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (_) => const ProfileSetupScreen()),
                        // )
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff782A36),
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      child: const Text("𝐋𝐨𝐠𝐢𝐧",
                          style: TextStyle(fontSize: 18, color: Colors.white)),
                    ),
                    const SizedBox(height: 20),
                    Row(children: const [
                      Expanded(child: Divider(color: Colors.white38)),
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text("OR",
                              style: TextStyle(color: Colors.white))),
                      Expanded(child: Divider(color: Colors.white38)),
                    ]),
                    const SizedBox(height: 15),
                    const Text("𝐂𝐨𝐧𝐭𝐢𝐧𝐮𝐞 𝐰𝐢𝐭𝐡",
                        style: TextStyle(color: Colors.white)),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        socialIcon(Icons.facebook),
                        const SizedBox(width: 25),
                        // 🔹 Google Sign-In Button
                        GestureDetector(
                          onTap: () async {
                            await signInWithGoogle(context);
                          },
                          child: socialIcon(Icons.g_mobiledata),
                        ),
                        const SizedBox(width: 25),
                        socialIcon(Icons.apple),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text("𝐃𝐨𝐧'𝐭 𝐡𝐚𝐯𝐞 𝐚𝐧 𝐚𝐜𝐜𝐨𝐮𝐧𝐭?",
                            style: TextStyle(color: Colors.white)),
                        SizedBox(width: 5),
                        Text("𝐒𝐢𝐠𝐧 𝐮𝐩",
                            style: TextStyle(
                                color: Colors.redAccent,
                                fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 🔹 Helper Widgets
  Widget fieldLabel(String text) => Align(
    alignment: Alignment.centerLeft,
    child:
    Text(text, style: const TextStyle(color: Colors.white, fontSize: 14)),
  );

  Widget customField({bool obscure = false}) => Container(
    decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.4),
        borderRadius: BorderRadius.circular(10)),
    child: TextField(
      obscureText: obscure,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.white, width: 1.2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.white, width: 1.5),
        ),
        contentPadding:
        const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
        border: InputBorder.none,
      ),
    ),
  );

  static Widget socialIcon(IconData iconData) => Container(
    height: 45,
    width: 45,
    decoration:
    const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
    child: Center(
        child: Icon(iconData, color: Color(0xff782A36), size: 26)),
  );
}