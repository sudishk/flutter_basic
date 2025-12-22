
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basic/core/di/injection.dart';
import 'package:flutter_basic/features/auth/presentation/pages/login_page.dart';
import 'package:flutter_basic/features/auth/presentation/pages/register_page.dart';

void main()async{
  init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RegisterPage(),
    );
  }
}

