import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
void main(){
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(onPressed: () {
              showDialog(context: context, builder: (context) {
                return AlertDialog(
                  title: Text("Delete Account"),
                  content: Text("Are you sure that you want to delete your account"),
                  actions: [

                    ElevatedButton(onPressed: () {
                      Navigator.pop(context);

                    }, child: Text("No")),

                    ElevatedButton(onPressed: () {
                      Fluttertoast.showToast(msg: "Account deleted successfully");
                      Navigator.pop(context);
                    }, child: Text("Yes")),
                  ],
                );
              },);
            }, child: Text("Delete Account")),
            ElevatedButton(onPressed: () {
              showDialog(context: context, builder: (context) {
                return Dialog(
                  shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(20)),
                  backgroundColor: Colors.white,
                  child:Column(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.logout),
                          Text("LogOut"),
                        ],
                      ),
                      Text("Are you sure that you want to logOut?"),
                      Row(children: [
                        ElevatedButton(onPressed: () {
                          Navigator.pop(context);
                        }, child: Text("No")),
                        ElevatedButton(onPressed: () {
                          Fluttertoast.showToast(msg: "Logout successfully");
                          Navigator.pop(context);
                        }, child: Text("Yes"))
                      ],)
                    ],
                  ) ,
                );
              },);
            }, child: Text("LogOut"))

          ],
        ),
      ),
    );
  }


}
