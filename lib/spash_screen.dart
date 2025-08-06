import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_basic/login_screen.dart';
import 'package:flutter_basic/profile_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();


    // Delay for 3 seconds then navigate
    Timer(Duration(seconds: 3), () {
      getData();

    });
  }


  getData()async{
    var sharePreference =await SharedPreferences.getInstance(); // object created
    bool status = sharePreference.getBool("login_stetus_key")??false;
    if(status){
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ProfileScreen()),
      );
    }else{
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    }


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Circular logo
            CircleAvatar(
              radius: 60,
              backgroundColor: Colors.purple.shade300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.show_chart, size: 40, color: Colors.white),
                  SizedBox(height: 5),
                  Text(
                    "SALES PRO",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 40),

            // App name & version
            Text(
              "Business Management",
              style: TextStyle(
                fontSize: 16,
                letterSpacing: 2,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text("V 1.0.0"),
          ],
        ),
      ),
    );
  }
}
