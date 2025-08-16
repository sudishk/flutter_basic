import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basic/api_services.dart';

void main(){
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FutureBuilder(future: ApiServices.getAllPostList(), builder: (context, snapshot) {

          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          }else if(snapshot.hasError){
            return Text("Error");
          }else {
            return Text(snapshot.data.toString());
          }
        },),
      )
    );
  }
}
