import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShowData extends StatefulWidget {
  const ShowData({super.key});

  @override
  State<ShowData> createState() => _ShowDataState();
}

class _ShowDataState extends State<ShowData> {
  String name="";
  String email="";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();

    }

    getData()async{
      var sharePreference =await SharedPreferences.getInstance(); // object created
      name = sharePreference.getString("name_key").toString();
      email = sharePreference.getString("email_key").toString();
      setState(() {

      });
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(name),
          Text(email),
        ],
      ),
    );
  }
}
