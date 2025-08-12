
import 'package:flutter/material.dart';
import 'package:flutter_basic/to_do_provider.dart';
import 'package:flutter_basic/to_do_screen.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => ToDoProvider(),)
  ],
  child: MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ToDoScreen(),
    );
  }
}

